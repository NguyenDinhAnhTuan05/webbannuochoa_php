<?php
require_once '../config/config.php';

$apikey = 'C23C22562B24A2AF6FC92477D79985B1';

define("CARD_LOG_FILE", "../card.log");

if (!file_exists(CARD_LOG_FILE)) {
    $fileHandle = fopen(CARD_LOG_FILE, 'w') or die("Không thể tạo file.");
    fclose($fileHandle);
}

$validate = validateCallback($_POST);

if ($validate !== false) {
    $status = $validate['status'];
    $serial = $validate['serial'];
    $pin = $validate['pin'];
    $card_type = $validate['card_type'];
    $amount = $validate['amount'];
    $content = $validate['content'];

    $stmt = $conn->prepare("SELECT * FROM trans_log WHERE status = 0 AND trans_id = ? AND pin = ? AND seri = ? AND type = ?");
    $stmt->bind_param("ssss", $content, $pin, $serial, $card_type);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $log = $result->fetch_assoc();
        $logID = $log['id'];
        $giatri = $row['giatri'];

        if ($status === 'thanhcong') {
            $price = $amount * 1;
            $stmt = $conn->prepare("UPDATE account SET money = money+ ? WHERE fullname = ?");
            $stmt->bind_param("iis", $price, $price, $log['name']);
            $stmt->execute();
            updateStatus($conn, $logID, 1);
        } elseif ($status === 'saimenhgia') {
            $stmt = $conn->prepare("UPDATE trans_log SET status = 3, amount = ? WHERE id = ?");
            $stmt->bind_param("ii", $amount, $logID);
            $stmt->execute();
            updateStatus($conn, $logID, 3);
        } else {
            updateStatus($conn, $logID, 2);
        }

        $logData = "Tai khoan: " . $log['username'] . ", data: " . json_encode($_POST) . "\r\n";
        file_put_contents(CARD_LOG_FILE, $logData, FILE_APPEND);
    }
}

function validateCallback($out)
{
    $requiredFields = ['status', 'serial', 'pin', 'card_type', 'amount', 'content'];

    foreach ($requiredFields as $field) {
        if (!isset($out[$field])) {
            return false;
        }
    }

    return $out;
}

function updateStatus($conn, $id, $status)
{
    $stmt = $conn->prepare("UPDATE trans_log SET status = ? WHERE id = ?");
    $stmt->bind_param("ii", $status, $id);
    $stmt->execute();
}
