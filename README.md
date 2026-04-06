<h1 align="center">✨ Nước Hoa Luxury - E-Commerce Website ✨</h1>

<p align="center">
  <img src="https://img.shields.io/badge/PHP-8.2-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP">
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/Docker-Enabled-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white" alt="CI/CD">
</p>

<p align="center">
  <b>Nền tảng thương mại điện tử chuyên cung cấp và bán lẻ các dòng nước hoa cao cấp, được tích hợp đầy đủ các tính năng quản lý giỏ hàng, thanh toán và quản trị hệ thống.</b>
</p>

---

## 🚀 Tính Năng Nổi Bật

- 🛍️ **Mua sắm linh hoạt**: Duyệt, tìm kiếm và xem chi tiết sản phẩm nước hoa.
- 🛒 **Quản lý Giỏ hàng**: Thêm, sửa, xóa sản phẩm trong giỏ hàng dễ dàng.
- 🔐 **Hệ thống Tài khoản**: Đăng nhập, Đăng ký, Cập nhật hồ sơ & Đổi mật khẩu.
- 💳 **Thanh toán Momo**: Tích hợp thanh toán trực tuyến qua ví Momo, xem lịch sử nạp & mua hàng.
- 👨‍💻 **Trang Quản trị (Admin Panel)**: Quản lý người dùng, sản phẩm, và đơn hàng chi tiết.
- 🐳 **Triển khai hiện đại (Docker)**: Đóng gói và chạy môi trường giả lập dễ dàng qua **Docker & Docker Compose**.
- 🛠️ **DevOps & CI/CD**: Tự động triển khai phiên bản phần mềm lên máy chủ VPS bằng **Github Actions**.

---

## 💻 Công Nghệ Sử Dụng

| Front-end & UI | Back-end | Cơ sở dữ liệu | DevOps & Hosting |
| --- | --- | --- | --- |
| HTML5 / CSS3 | PHP 8.2 (Vanila) | MySQL 8.0 | Docker Engine |
| Vanilla JS | Tích hợp APIs | `webbanhang.sql` | Docker Compose |
| Assets System | Hệ thống Session | Lưới bảo mật PDO | GitHub Actions CI/CD |

---

## 🛠 Hướng Dẫn Cài Đặt Tại Máy Dành Cho Lập Trình Viên

Dự án đã được tích hợp sẵn cấu trúc Docker, giúp bạn khởi chạy ngay lập tức mà không cần mệt mỏi cài đặt các phần mềm XAMPP, MAMP hay can thiệp vào môi trường gốc của máy.

### 📌 Yêu cầu hệ thống:
- [Docker Engine](https://docs.docker.com/get-docker/) & [Docker Compose](https://docs.docker.com/compose/install/) đã được kích hoạt.

### 📌 Các bước khởi chạy:

1. **Clone dự án về máy:**
   ```bash
   git clone https://github.com/ten-cua-ban/webbannuochoa.git
   cd webbannuochoa
   ```

2. **Chạy hệ thống lên với Docker:**
   Khởi động toàn bộ cụm chứa MySQL Data và PHP Core bằng dòng lệnh sau:
   ```bash
   docker-compose up -d --build
   ```
   > ⏳ **Lưu ý:** Trong lần khởi chạy đầu tiên, MySQL Container của Docker sẽ mất khoảng 1 phút để chạy script `/sql/webbanhang.sql` cấu trúc lại toàn bộ các bảng vào Database.

3. **Truy cập ứng dụng:**
   - 🌎 Trải nghiệm tại Website chính: [http://localhost](http://localhost)

---

## ☁️ Quy Trình Triển Khai (Deploy) CI/CD Trên VPS Máy Chủ

Quy trình xuất bản mã nguồn sẽ nằm trong workflow tại thư mục `.github/workflows/deploy.yml`. Tự động hoá mọi bước đẩy ứng dụng từ GitHub thẳng xuống VPS của bạn mà không cần đụng tay vào lệnh.

1. Bạn tiến hành khai báo các loại khoá bảo vệ (Secrets) trong kho lưu trữ Github (Settings -> Actions Secrets):
   - `SERVER_HOST`: Tọa độ trỏ tới máy chủ (Ví dụ: `36.50.135.61`).
   - `SERVER_USERNAME`: Tài khoản gốc rễ đăng nhập (Như Root/Admin).
   - `SERVER_PORT`: Định tuyến mở port (Đa số VPS là Port `22`).
   - `SERVER_SSH_KEY`: Chuỗi chìa khoá bí mật cấu trúc RSA.
   - Các trường bảo mật liên đới DB (Cấu hình riêng bên ngoài): `DB_USER`, `DB_PASS`, `DB_NAME`.

2. Cam kết và Đẩy dữ liệu:
   ```bash
   git add .
   git commit -m "Tính năng: Thêm phần mới"
   git push origin main
   ```
   
3. **Github Actions** sẽ đánh giá và lập tức tung bản cập nhật đó chạy sống trên toàn cầu.

---

<p align="center">
  <i>Được phát triển và đóng gói chỉn chu bằng tất cả tâm huyết ❤️ <br>Nếu source code này tốt và hữu ích, hãy thoải mái cho xin 1 ⭐ nhé!</i>
</p>
