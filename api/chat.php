<?php
require_once '../config/config.php';

$api_key = 'AIzaSyD6SwZr3r7c-Uehv5gwgII4D49ISRr3Az4';
$url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $json_str = file_get_contents('php://input');
    
    if (!$json_str) {
        echo json_encode(['success' => false, 'error' => 'Không có dữ liệu đầu vào']);
        exit;
    }
    
    $data = json_decode($json_str, true);
    if (!$data || !isset($data['message'])) {
        echo json_encode(['success' => false, 'error' => 'Dữ liệu JSON không hợp lệ']);
        exit;
    }
    
    $message = $data['message'];
    
    try {
        // Lấy danh sách thương hiệu từ database
        $brands = [];
        $brands_result = $conn->query("SELECT name FROM brands ORDER BY name");
        while ($row = $brands_result->fetch_assoc()) {
            $brands[] = $row['name'];
        }
        $brands_list = implode(", ", $brands);

        // Xử lý tìm kiếm sản phẩm
        $product_info = "";
        
        // Xử lý yêu cầu về giá
        if (preg_match('/(\d+)\s*(triệu|tr|trệu|nghìn|k|trở lại)/u', $message, $matches)) {
            $amount = (float)$matches[1];
            $unit = $matches[2] ?? '';
            
            // Quy đổi về VND
            $max_price = match($unit) {
                'triệu', 'tr', 'trệu' => $amount * 1000000,
                'nghìn', 'k' => $amount * 1000,
                default => $amount * 1000000 // Mặc định là triệu
            };

            // Tìm sản phẩm trong khoảng giá
            $stmt = $conn->prepare("SELECT * FROM all_product WHERE price_product <= ? ORDER BY price_product DESC LIMIT 5");
            $stmt->bind_param("i", $max_price);
            $stmt->execute();
            $products = $stmt->get_result();

            if ($products->num_rows > 0) {
                $product_info .= "Các sản phẩm dưới " . number_format($max_price, 0, ',', '.') . " VND:\n";
                while ($product = $products->fetch_assoc()) {
                    $product_info .= sprintf(
                        "- %s\n  Giá: %s VND\n  <a href='product-detail.php?id=%d'>Xem chi tiết</a>\n\n",
                        $product['name_product'],
                        number_format($product['price_product'], 0, ',', '.'),
                        $product['id_product']
                    );
                }
            }
        }

        // Tạo context cho AI
        $context = "Bạn là trợ lý bán hàng cho cửa hàng nước hoa. Thương hiệu có sẵn: $brands_list. "
                 . "Hãy trả lời bằng tiếng Việt, thân thiện. Khi đề cập sản phẩm, luôn hiển thị: "
                 . "- Tên sản phẩm\n- Giá\n- Link chi tiết dạng <a href='product-detail.php?id=ID'>Xem chi tiết</a>\n\n"
                 . "Thông tin sản phẩm hiện có:\n$product_info";

      
        $request_body = [
            'contents' => [
                [
                    'parts' => [
                        ['text' => "$context\n\nUser: $message\nAssistant:"]
                    ]
                ]
            ],
            'generationConfig' => [
                'temperature' => 0.7,
                'maxOutputTokens' => 1000
            ],
            'safetySettings' => [
                ['category' => 'HARM_CATEGORY_HARASSMENT', 'threshold' => 'BLOCK_NONE'],
                ['category' => 'HARM_CATEGORY_HATE_SPEECH', 'threshold' => 'BLOCK_NONE'],
                ['category' => 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold' => 'BLOCK_NONE'],
                ['category' => 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold' => 'BLOCK_NONE']
            ]
        ];

        // Gọi API Gemini
        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => $url . '?key=' . $api_key,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => json_encode($request_body),
            CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
            CURLOPT_TIMEOUT => 15
        ]);

        $response = curl_exec($ch);
        
        if (curl_errno($ch)) {
            throw new Exception("Lỗi kết nối: " . curl_error($ch));
        }

        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($http_code === 200) {
            $response_data = json_decode($response, true);
            if (isset($response_data['candidates'][0]['content']['parts'][0]['text'])) {
                $ai_response = $response_data['candidates'][0]['content']['parts'][0]['text'];
                echo json_encode([
                    'success' => true, 
                    'response' => $ai_response,
                    'product_info' => $product_info 
                ]);
            } else {
                throw new Exception("Phản hồi API không hợp lệ");
            }
        } else {
            throw new Exception("Lỗi API (Mã $http_code): " . $response);
        }
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'error' => $e->getMessage(),
            'product_info' => $product_info
        ]);
    }
} else {
    http_response_code(405);
    echo json_encode(['success' => false, 'error' => 'Phương thức không được hỗ trợ']);
}
?>