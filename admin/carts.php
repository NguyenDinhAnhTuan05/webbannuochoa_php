<?php
require_once '../functions/functions.php';
require_once __DIR__ . '/../config/config.php';

// Kiểm tra quyền admin
checkAdmin();

require_once __DIR__ . '/header-admin.php';

// Filter by user if requested
$user_filter = "";
$user_name = "";
if (isset($_GET['user_id']) && !empty($_GET['user_id'])) {
    $user_id = (int)$_GET['user_id'];
    $user_filter = "AND o.user_id = $user_id";
    
    // Get user name for display
    $user_query = "SELECT fullname FROM account WHERE id = $user_id";
    $user_result = $conn->query($user_query);
    if ($user_result && $user_result->num_rows > 0) {
        $user_name = $user_result->fetch_assoc()['fullname'];
    }
}

// Filter by order status if requested
$status_filter = "";
if (isset($_GET['status']) && !empty($_GET['status'])) {
    $status = $conn->real_escape_string($_GET['status']);
    $status_filter = "AND o.order_status = '$status'";
}

// Lấy danh sách đơn hàng
$orders_query = "SELECT o.*, a.fullname, a.email, a.phone, a.address,
                (SELECT SUM(price * quantity) FROM order_items WHERE order_id = o.id) as total_amount
                FROM orders o 
                JOIN account a ON o.user_id = a.id 
                WHERE 1=1 $user_filter $status_filter
                ORDER BY o.created_at DESC";
$orders = $conn->query($orders_query);

// Xử lý cập nhật trạng thái
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_status'])) {
    $order_id = (int)$_POST['order_id'];
    $status = $_POST['status'];
    
    $update_query = "UPDATE orders SET order_status = ? WHERE id = ?";
    $stmt = $conn->prepare($update_query);
    $stmt->bind_param("si", $status, $order_id);
    
    if ($stmt->execute()) {
        $success = "Cập nhật trạng thái thành công!";
    } else {
        $error = "Có lỗi xảy ra khi cập nhật trạng thái!";
        error_log("Lỗi cập nhật trạng thái: " . $stmt->error, 0);
    }
}

// Lấy số liệu thống kê đơn hàng theo trạng thái
$status_stats_query = "SELECT 
                        order_status, 
                        COUNT(*) as count
                      FROM orders 
                      GROUP BY order_status";
$status_stats = $conn->query($status_stats_query);
$stats = [
    'pending' => 0,
    'processing' => 0,
    'shipped' => 0,
    'delivered' => 0,
    'cancelled' => 0
];

while ($stat = $status_stats->fetch_assoc()) {
    $stats[$stat['order_status']] = $stat['count'];
}
?>



<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="mb-0">
        Quản lý đơn hàng
        <?php if (!empty($user_name)): ?>
            <small class="text-muted">- Khách hàng: <?= $user_name ?></small>
        <?php endif; ?>
    </h2>
    <?php if (!empty($user_filter)): ?>
        <a href="carts.php" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left"></i> Quay lại tất cả đơn hàng
        </a>
    <?php endif; ?>
</div>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?= $success ?></div>
<?php endif; ?>

<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?= $error ?></div>
<?php endif; ?>

<div class="row mb-4">
    <div class="col-xl-2 col-md-4 col-sm-6 mb-2">
        <a href="carts.php" class="text-decoration-none">
            <div class="card text-center">
                <div class="card-body py-3">
                    <div class="h5 mb-0 font-weight-bold">Tất cả (<?= array_sum($stats) ?>)</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-xl-2 col-md-4 col-sm-6 mb-2">
        <a href="carts.php?status=pending" class="text-decoration-none">
            <div class="card text-center border-warning">
                <div class="card-body py-3">
                    <div class="h5 mb-0 font-weight-bold text-warning">Chờ xử lý (<?= $stats['pending'] ?>)</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-xl-2 col-md-4 col-sm-6 mb-2">
        <a href="carts.php?status=processing" class="text-decoration-none">
            <div class="card text-center border-info">
                <div class="card-body py-3">
                    <div class="h5 mb-0 font-weight-bold text-info">Đang xử lý (<?= $stats['processing'] ?>)</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-xl-2 col-md-4 col-sm-6 mb-2">
        <a href="carts.php?status=shipped" class="text-decoration-none">
            <div class="card text-center border-primary">
                <div class="card-body py-3">
                    <div class="h5 mb-0 font-weight-bold text-primary">Đang giao (<?= $stats['shipped'] ?>)</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-xl-2 col-md-4 col-sm-6 mb-2">
        <a href="carts.php?status=delivered" class="text-decoration-none">
            <div class="card text-center border-success">
                <div class="card-body py-3">
                    <div class="h5 mb-0 font-weight-bold text-success">Đã giao (<?= $stats['delivered'] ?>)</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-xl-2 col-md-4 col-sm-6 mb-2">
        <a href="carts.php?status=cancelled" class="text-decoration-none">
            <div class="card text-center border-danger">
                <div class="card-body py-3">
                    <div class="h5 mb-0 font-weight-bold text-danger">Đã hủy (<?= $stats['cancelled'] ?>)</div>
                </div>
            </div>
        </a>
    </div>
</div>

<div class="card shadow">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Tổng tiền</th>
                        <th>Phương thức</th>
                        <th>Trạng thái</th>
                        <th>Ngày đặt</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($orders->num_rows > 0): ?>
                        <?php while ($order = $orders->fetch_assoc()): ?>
                            <tr>
                                <td>#<?= $order['id'] ?></td>
                                <td>
                                    <?= htmlspecialchars($order['fullname']) ?><br>
                                    <small><?= htmlspecialchars($order['email']) ?></small>
                                </td>
                                <td><?= format_currency($order['total_amount']) ?></td>
                                <td><?= htmlspecialchars($order['payment_method']) ?></td>
                                <td>
                                    <form method="POST">
                                        <input type="hidden" name="order_id" value="<?= $order['id'] ?>">
                                        <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
                                            <option value="pending" <?= $order['order_status'] == 'pending' ? 'selected' : '' ?>>Chờ xử lý</option>
                                            <option value="processing" <?= $order['order_status'] == 'processing' ? 'selected' : '' ?>>Đang xử lý</option>
                                            <option value="shipped" <?= $order['order_status'] == 'shipped' ? 'selected' : '' ?>>Đang giao</option>
                                            <option value="delivered" <?= $order['order_status'] == 'delivered' ? 'selected' : '' ?>>Đã giao</option>
                                            <option value="cancelled" <?= $order['order_status'] == 'cancelled' ? 'selected' : '' ?>>Đã hủy</option>
                                        </select>
                                        <input type="hidden" name="update_status" value="1">
                                    </form>
                                </td>
                                <td><?= date('d/m/Y H:i', strtotime($order['created_at'])) ?></td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#orderDetail<?= $order['id'] ?>">
                                        <i class="fas fa-info-circle"></i> Chi tiết
                                    </button>
                                    <div class="modal fade" id="orderDetail<?= $order['id'] ?>">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Chi tiết đơn hàng #<?= $order['id'] ?></h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row mb-4">
                                                        <div class="col-md-6">
                                                            <h6 class="fw-bold">Thông tin khách hàng:</h6>
                                                            <p>Tên: <?= htmlspecialchars($order['fullname']) ?></p>
                                                            <p>Email: <?= htmlspecialchars($order['email']) ?></p>
                                                            <p>Điện thoại: <?= htmlspecialchars($order['phone']) ?></p>
                                                            <p>Địa chỉ: <?= htmlspecialchars($order['address']) ?></p>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <h6 class="fw-bold">Thông tin đơn hàng:</h6>
                                                            <p>Mã đơn: #<?= $order['id'] ?></p>
                                                            <p>Ngày đặt: <?= date('d/m/Y H:i', strtotime($order['created_at'])) ?></p>
                                                            <p>Phương thức thanh toán: <?= htmlspecialchars($order['payment_method']) ?></p>
                                                            <p>Trạng thái: 
                                                                <span class="status-badge <?= $order['order_status'] ?>">
                                                                    <?= getOrderStatusText($order['order_status']) ?>
                                                                </span>
                                                            </p>
                                                            <p>Ghi chú: <?= htmlspecialchars($order['note'] ?: 'Không có') ?></p>
                                                        </div>
                                                    </div>
                                                    
                                                    <h6 class="fw-bold border-top pt-3">Sản phẩm:</h6>
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead class="table-light">
                                                                <tr>
                                                                    <th>Sản phẩm</th>
                                                                    <th>Giá</th>
                                                                    <th>Số lượng</th>
                                                                    <th>Tổng</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <?php
                                                                $items_query = "SELECT oi.*, p.name_product, p.link_product 
                                                                            FROM order_items oi
                                                                            JOIN all_product p ON oi.product_id = p.id_product
                                                                            WHERE oi.order_id = ?";
                                                                $stmt_items = $conn->prepare($items_query);
                                                                $stmt_items->bind_param("i", $order['id']);
                                                                $stmt_items->execute();
                                                                $items = $stmt_items->get_result();
                                                                $subtotal = 0;
                                                                
                                                                while ($item = $items->fetch_assoc()):
                                                                    $item_total = $item['price'] * $item['quantity'];
                                                                    $subtotal += $item_total;
                                                                ?>
                                                                    <tr>
                                                                        <td class="d-flex align-items-center">
                                                                            <?php if (!empty($item['link_product'])): ?>
                                                                                <img src="../<?= $item['link_product'] ?>" alt="<?= $item['name_product'] ?>" 
                                                                                     class="img-thumbnail me-2" style="width: 50px; height: 50px; object-fit: cover;">
                                                                            <?php endif; ?>
                                                                            <?= htmlspecialchars($item['name_product']) ?>
                                                                        </td>
                                                                        <td><?= format_currency($item['price']) ?></td>
                                                                        <td><?= $item['quantity'] ?></td>
                                                                        <td><?= format_currency($item_total) ?></td>
                                                                    </tr>
                                                                <?php endwhile; ?>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <td colspan="3" class="text-end fw-bold">Tổng cộng:</td>
                                                                    <td class="fw-bold"><?= format_currency($subtotal) ?></td>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                    
                                                    <div class="mt-3">
                                                        <form method="POST">
                                                            <input type="hidden" name="order_id" value="<?= $order['id'] ?>">
                                                            <div class="row">
                                                                <div class="col-md-8">
                                                                    <select name="status" class="form-select">
                                                                        <option value="pending" <?= $order['order_status'] == 'pending' ? 'selected' : '' ?>>Chờ xử lý</option>
                                                                        <option value="processing" <?= $order['order_status'] == 'processing' ? 'selected' : '' ?>>Đang xử lý</option>
                                                                        <option value="shipped" <?= $order['order_status'] == 'shipped' ? 'selected' : '' ?>>Đang giao</option>
                                                                        <option value="delivered" <?= $order['order_status'] == 'delivered' ? 'selected' : '' ?>>Đã giao</option>
                                                                        <option value="cancelled" <?= $order['order_status'] == 'cancelled' ? 'selected' : '' ?>>Đã hủy</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <button type="submit" name="update_status" value="1" class="btn btn-primary">
                                                                        Cập nhật trạng thái
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="7" class="text-center py-4">Không có đơn hàng nào</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
            <?php
            $total_query = "SELECT SUM(oi.price * oi.quantity) as grand_total 
                            FROM order_items oi
                            INNER JOIN orders o ON oi.order_id = o.id
                            WHERE o.order_status = 'delivered' $user_filter";
            $total_result = $conn->query($total_query);
            $grand_total = $total_result->fetch_assoc()['grand_total'] ?? 0;
            ?>
            <div class="text-end mt-3">
                <h5 class="text-success fw-bold">Tổng doanh thu: <?= format_currency($grand_total) ?></h5>
            </div>
        </div>
    </div>
</div>



