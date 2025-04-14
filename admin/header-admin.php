<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản trị viên</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="../assets/css/admin.css" rel="stylesheet">
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #4361ee;
            --success-color: #4cc9f0;
            --info-color: #4895ef;
            --warning-color: #f72585;
            --danger-color: #e63946;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --sidebar-width: 200px;
            --header-height: 60px;
            --sidebar-collapsed-width: 70px;
            --border-radius: 0.25rem;
            --transition-speed: 0.3s;
            --box-shadow: 0 0.25rem 1rem rgba(0, 0, 0, 0.1);
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        

        
        /* Sidebar */
        .admin-sidebar {
            width: var(--sidebar-width);
            background-color: #4361ee;
            color: #fff;
            position: fixed;
            height: 100vh;
            top: 0;
            left: 0;
            z-index: 100;
            transition: all var(--transition-speed);
            overflow-y: auto;
        }
        
        .admin-sidebar.collapsed {
            width: var(--sidebar-collapsed-width);
        }
        
        .sidebar-brand {
            padding: 1rem;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: var(--header-height);
        }
        
        .sidebar-brand h2 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 700;
            color: #fff;
        }
        
        .sidebar-brand .toggle-sidebar {
            background: transparent;
            border: none;
            color: #fff;
            cursor: pointer;
            font-size: 1.25rem;
            transition: transform var(--transition-speed);
        }
        
        .sidebar-brand .toggle-sidebar:hover {
            transform: rotate(180deg);
        }
        
        .sidebar-nav {
            padding: 0;
            list-style: none;
            margin: 0;
        }
        
        .sidebar-nav .nav-item {
            margin-bottom: 0;
        }
        
        .sidebar-nav .nav-link {
            color: rgba(255, 255, 255, 0.9);
            padding: 0.75rem 1rem;
            display: flex;
            align-items: center;
            transition: all var(--transition-speed);
            text-decoration: none;
            border-left: 3px solid transparent;
        }
        
        .sidebar-nav .nav-link:hover,
        .sidebar-nav .nav-link.active {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.1);
            border-left: 3px solid #fff;
        }
        
        .sidebar-nav .nav-link i {
            margin-right: 0.75rem;
            width: 1.25rem;
            text-align: center;
            font-size: 1rem;
            transition: all var(--transition-speed);
        }
        
        .admin-sidebar.collapsed .sidebar-nav .nav-link span,
        .admin-sidebar.collapsed .sidebar-brand h2 {
            display: none;
        }
        
        .admin-sidebar.collapsed .sidebar-nav .nav-link i {
            margin-right: 0;
            font-size: 1.25rem;
        }
        
        .admin-sidebar.collapsed .sidebar-nav .nav-item {
            text-align: center;
        }
        
        
        



        
        .breadcrumb-container {
            display: flex;
            align-items: center;
        }
        
        .breadcrumb {
            margin-bottom: 0;
            background: transparent;
            padding: 0;
        }
        
        .search-container {
            position: relative;
            width: 250px;
        }
        
        .search-container input {
            width: 100%;
            padding: 0.5rem 1rem 0.5rem 2.5rem;
            border-radius: 50px;
            border: 1px solid #e2e8f0;
            background-color: #f8fafc;
            transition: all var(--transition-speed);
            font-size: 0.9rem;
        }
        
        .search-container input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        }
        
        .search-container i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
        }

        .user-dropdown {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem;
            border-radius: var(--border-radius);
            cursor: pointer;
            color: var(--dark-color);
            transition: all var(--transition-speed);
        }

        .user-dropdown:hover {
            background-color: #f8fafc;
        }

        .user-dropdown .avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 1rem;
        }

        .user-dropdown .user-info {
            display: flex;
            flex-direction: column;
        }

        .user-dropdown .user-name {
            font-weight: 600;
            font-size: 0.85rem;
        }

        .user-dropdown .user-role {
            font-size: 0.7rem;
            color: #6c757d;
        }

        /* Content container */
        .content-container {
            padding: 1rem;
            background-color: #f5f7fa;
            flex: 1;
        }
        
        /* Main Content */
        .main-content {
            margin-left: var(--sidebar-width);
            width: calc(100% - var(--sidebar-width));
            padding: 1rem;
            transition: all var(--transition-speed);
        }
        
        .main-content.expanded {
            margin-left: var(--sidebar-collapsed-width);
            width: calc(100% - var(--sidebar-collapsed-width));
        }
        
        /* Cards */
        .card, .dashboard-card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            transition: all 0.3s cubic-bezier(.25,.8,.25,1);
            overflow: hidden;
            margin-bottom: 1.5rem;
            background-color: #fff;
        }
        
        .card:hover, .dashboard-card:hover {
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }

        .card-header, .dashboard-card-header {
            background-color: #fff;
            border-bottom: 1px solid #e3e6f0;
            padding: 0.75rem 1.25rem;
            font-weight: 600;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Tables */
        .table {
            color: var(--dark-color);
            margin-bottom: 0;
        }

        .table th {
            font-weight: 600;
            color: var(--primary-color);
            background-color: #f8f9fc;
            border-bottom: 2px solid #e3e6f0;
            padding: 0.75rem;
            font-size: 0.85rem;
        }
        
        .table td {
            padding: 0.75rem;
            vertical-align: middle;
        }

        /* Badges */
        .badge {
            font-weight: 600;
            font-size: 0.75rem;
            padding: 0.35em 0.65em;
            border-radius: 50px;
        }

        /* Buttons */
        .btn {
            font-weight: 500;
            border-radius: var(--border-radius);
            padding: 0.375rem 0.75rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: all var(--transition-speed);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            filter: brightness(90%);
        }

        .btn-success {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }

        .btn-info {
            background-color: var(--info-color);
            border-color: var(--info-color);
        }

        .btn-warning {
            background-color: var(--warning-color);
            border-color: var(--warning-color);
        }

        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }
        
        .btn-icon {
            width: 2rem;
            height: 2rem;
            padding: 0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }
        
        /* Stats Cards */
        .border-left-primary {
            border-left: 0.25rem solid var(--primary-color) !important;
        }
        
        .border-left-success {
            border-left: 0.25rem solid var(--success-color) !important;
        }
        
        .border-left-info {
            border-left: 0.25rem solid var(--info-color) !important;
        }
        
        .border-left-warning {
            border-left: 0.25rem solid var(--warning-color) !important;
        }
        
        .border-left-danger {
            border-left: 0.25rem solid var(--danger-color) !important;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .admin-sidebar {
                width: 100%;
                position: relative;
                height: auto;
                display: none;
            }
            
            .admin-sidebar.mobile-show {
                display: block;
            }

            
            .mobile-toggle {
                display: block !important;
            }
        }
        
        .mobile-toggle {
            display: none;
            background: transparent;
            border: none;
            font-size: 1.25rem;
            color: var(--dark-color);
        }
        
        .loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            opacity: 1;
            transition: opacity 0.5s;
        }
        
        .loader.hide {
            opacity: 0;
            pointer-events: none;
        }
        
        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid rgba(0, 0, 0, 0.1);
            border-radius: 50%;
            border-top-color: var(--primary-color);
            animation: spin 1s ease-in-out infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
        /* Status badges */
        .status-badge {
            padding: 0.35em 0.65em;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.75rem;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .status-badge-pending {
            background-color: rgba(246, 194, 62, 0.15);
            color: #f6c23e;
        }
        
        .status-badge-processing {
            background-color: rgba(54, 185, 204, 0.15);
            color: #36b9cc;
        }
        
        .status-badge-shipped {
            background-color: rgba(78, 115, 223, 0.15);
            color: #4e73df;
        }
        
        .status-badge-delivered {
            background-color: rgba(28, 200, 138, 0.15);
            color: #1cc88a;
        }
        
        .status-badge-cancelled {
            background-color: rgba(231, 74, 59, 0.15);
            color: #e74a3b;
        }

        /* Dashboard specific styles */
        .page-title {
            margin-bottom: 1.5rem;
            color: #333;
            font-weight: 600;
        }

        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        /* Right Sidebar */
        .right-sidebar {
            position: fixed;
            top: var(--header-height);
            right: 0;
            width: 300px;
            height: calc(100vh - var(--header-height));
            background-color: #fff;
            border-left: 1px solid #edf2f9;
            z-index: 99;
            overflow-y: auto;
            transition: all var(--transition-speed);
            transform: translateX(100%);
            box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .right-sidebar.show {
            transform: translateX(0);
        }
        
        .right-sidebar-toggle {
            background: transparent;
            border: none;
            color: var(--dark-color);
            font-size: 1.25rem;
            cursor: pointer;
            transition: all var(--transition-speed);
            position: relative;
        }
        
        .right-sidebar-toggle:hover {
            color: var(--primary-color);
        }
        
        .right-sidebar-toggle .badge {
            font-size: 0.65rem;
            padding: 0.2em 0.4em;
            position: absolute;
            top: -5px;
            right: -5px;
            transform: none;
        }
        
        .right-sidebar-header {
            padding: 1rem;
            border-bottom: 1px solid #edf2f9;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .right-sidebar-header h5 {
            margin: 0;
            font-weight: 600;
        }
        
        .right-sidebar-close {
            background: transparent;
            border: none;
            color: var(--dark-color);
            cursor: pointer;
            font-size: 1rem;
        }
        
        .right-sidebar-body {
            padding: 1rem;
        }
        
        .info-panel {
            margin-bottom: 1.5rem;
        }
        
        .info-panel-header {
            margin-bottom: 0.75rem;
            font-weight: 600;
            color: var(--primary-color);
            font-size: 0.95rem;
        }
        
        .info-card {
            padding: 1rem;
            background-color: #f8fafc;
            border-radius: var(--border-radius);
            margin-bottom: 0.75rem;
            border-left: 3px solid var(--primary-color);
        }
        
        .info-card-title {
            font-weight: 600;
            font-size: 0.85rem;
            margin-bottom: 0.25rem;
        }
        
        .info-card-text {
            font-size: 0.8rem;
            color: #6c757d;
        }
        
        .activity-item {
            display: flex;
            margin-bottom: 1rem;
            position: relative;
        }
        
        .activity-icon {
            margin-right: 0.75rem;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            color: #fff;
        }
        
        .activity-icon.bg-primary {
            background-color: var(--primary-color);
        }
        
        .activity-icon.bg-success {
            background-color: var(--success-color);
        }
        
        .activity-icon.bg-info {
            background-color: var(--info-color);
        }
        
        .activity-icon.bg-warning {
            background-color: var(--warning-color);
        }
        
        .activity-content {
            flex: 1;
        }
        
        .activity-title {
            font-weight: 600;
            font-size: 0.85rem;
            margin-bottom: 0.25rem;
        }
        
        .activity-time {
            font-size: 0.75rem;
            color: #6c757d;
        }
        
        .activity-description {
            font-size: 0.8rem;
            margin-top: 0.25rem;
        }
        
        /* Equal height cards */
        .dashboard-card-equal-height {
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .dashboard-card-equal-height .dashboard-card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        
        .dashboard-card-equal-height .chart-container {
            flex: 1;
            position: relative;
            min-height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .chart-container canvas {
            max-width: 100%;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <aside class="admin-sidebar" id="sidebar">
            <div class="sidebar-brand">
                <h2>ADMIN</h2>
                <button class="toggle-sidebar" id="toggleSidebar">
                    <i class="fas fa-chevron-left"></i>
                </button>
            </div>
            
            <ul class="sidebar-nav">
                <li class="nav-item">
                    <a href="index.php" class="nav-link">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Tổng quan</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="products.php" class="nav-link">
                        <i class="fas fa-box"></i>
                        <span>Sản phẩm</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="categories.php" class="nav-link">
                        <i class="fas fa-list"></i>
                        <span>Danh mục</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="carts.php" class="nav-link">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Đơn hàng</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="users.php" class="nav-link">
                        <i class="fas fa-user"></i>
                        <span>Khách hàng</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="logout.php" class="nav-link">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Đăng xuất</span>
                    </a>
                </li>
            </ul>
        </aside>
        
            
            
        <!-- Main Content -->
        <div id="mainContent" class="main-content">

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Sidebar toggle
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');
            const toggleSidebar = document.getElementById('toggleSidebar');
            const mobileToggle = document.getElementById('mobileToggle');
            const loader = document.querySelector('.loader');
            const rightSidebar = document.getElementById('rightSidebar');
            const toggleRightSidebar = document.getElementById('toggleRightSidebar');
            const closeRightSidebar = document.getElementById('closeRightSidebar');
            
            // Hide loader after page load
            setTimeout(function() {
                loader.classList.add('hide');
            }, 500);
            
            // Toggle left sidebar
            toggleSidebar.addEventListener('click', function() {
                sidebar.classList.toggle('collapsed');
                mainContent.classList.toggle('expanded');
            });
            
            // Mobile sidebar toggle
            mobileToggle.addEventListener('click', function() {
                sidebar.classList.toggle('mobile-show');
            });
            
            // Toggle right sidebar
            toggleRightSidebar.addEventListener('click', function() {
                rightSidebar.classList.toggle('show');
            });
            
            // Close right sidebar
            closeRightSidebar.addEventListener('click', function() {
                rightSidebar.classList.remove('show');
            });
            
            // Set current page in breadcrumb
            const currentPageElement = document.getElementById('currentPage');
            if (currentPageElement) {
                const pageTitle = document.title.split('-')[0].trim();
                currentPageElement.textContent = pageTitle;
            }
        });
    </script>
</body>
</html> 