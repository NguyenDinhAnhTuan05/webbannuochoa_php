#!/bin/bash
# =============================================================================
# SCRIPT LẤY SSL CERTIFICATE LẦN ĐẦU CHO hocvien.online
# Chạy lệnh này MỘT LẦN sau khi deploy xong
#
# Cách dùng (trên server):
#   chmod +x init_ssl.sh
#   sudo bash init_ssl.sh
# =============================================================================

set -e

DOMAIN="hocvien.online"
EMAIL="your-email@gmail.com"   # ← ĐỔI EMAIL CỦA BẠN VÀO ĐÂY
DEPLOY_DIR="/var/www/webbannuochoa"

cd "$DEPLOY_DIR"

echo "============================================"
echo "🔐 Lấy SSL Certificate cho $DOMAIN"
echo "============================================"

# Bước 1: Tạo thư mục certbot
mkdir -p nginx/certbot/conf nginx/certbot/www

# Bước 2: Dùng config HTTP-only tạm thời để Nginx khởi động được (chưa có cert)
echo "📋 Dùng Nginx config HTTP-only tạm thời..."
cp nginx/default.conf nginx/default.conf.backup
cp nginx/default-http-only.conf nginx/default.conf

# Bước 3: Khởi động Nginx
docker compose up -d nginx app db

echo "⏳ Chờ Nginx khởi động..."
sleep 5

# Bước 4: Chạy Certbot lấy certificate
echo "🔑 Đang lấy SSL Certificate từ Let's Encrypt..."
docker compose run --rm certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email \
  -d "$DOMAIN" \
  -d "www.$DOMAIN"

echo ""
echo "✅ Đã lấy SSL Certificate thành công!"

# Bước 5: Khôi phục config HTTPS đầy đủ
echo "📋 Khôi phục Nginx config HTTPS..."
cp nginx/default.conf.backup nginx/default.conf

# Bước 6: Reload Nginx để dùng SSL
echo "🔄 Reload Nginx với SSL..."
docker compose exec nginx nginx -s reload

echo ""
echo "============================================"
echo "🎉 HTTPS đã hoạt động tại: https://$DOMAIN"
echo "============================================"
echo ""
echo "💡 Certificate sẽ tự động gia hạn mỗi 12 giờ."
