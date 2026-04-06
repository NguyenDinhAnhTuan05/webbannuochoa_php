#!/bin/bash
# =============================================================================
# SCRIPT LẤY SSL CERTIFICATE LẦN ĐẦU CHO hocvien.online
# Chạy lệnh này MỘT LẦN trên server, sau khi GitHub Actions deploy xong
#
# Cách dùng:
#   chmod +x init_ssl.sh
#   sudo bash init_ssl.sh
# =============================================================================

set -e

DOMAIN="hocvien.online"
EMAIL="nguyentuan834897@gmail.com"  
DEPLOY_DIR="/var/www/webbannuochoa"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

cd "$DEPLOY_DIR"

echo "============================================"
echo "🔐 Lấy SSL Certificate cho $DOMAIN"
echo "============================================"

# Bước 1: Kiểm tra containers đã chạy chưa
if ! docker compose ps | grep -q "webbannuochoa_nginx"; then
  echo -e "${YELLOW}⚠️  Nginx chưa chạy. Khởi động containers...${NC}"
  docker compose up -d
  sleep 5
fi

# Bước 2: Tạo thư mục certbot
mkdir -p nginx/certbot/conf nginx/certbot/www

# Bước 3: Lấy SSL Certificate từ Let's Encrypt
echo -e "${GREEN}🔑 Đang lấy SSL Certificate...${NC}"
docker compose run --rm --entrypoint "certbot" certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email \
  -d "$DOMAIN" \
  -d "www.$DOMAIN"

echo -e "${GREEN}✅ Đã lấy SSL Certificate thành công!${NC}"

# Bước 4: Swap sang config HTTPS đầy đủ
echo "📋 Kích hoạt Nginx HTTPS config..."
# Cập nhật docker-compose để mount config HTTPS
sed -i 's|default-http-only.conf:/etc/nginx/conf.d/default.conf|default.conf:/etc/nginx/conf.d/default.conf|g' docker-compose.yml

# Bước 5: Restart Nginx với config mới
echo "🔄 Restart Nginx với HTTPS..."
docker compose up -d --force-recreate nginx

echo ""
echo "============================================"
echo -e "${GREEN}🎉 THÀNH CÔNG!${NC}"
echo "   🌐 HTTP  → https://$DOMAIN (auto redirect)"
echo "   🔐 HTTPS → https://$DOMAIN"
echo "============================================"
echo ""
echo -e "${YELLOW}💡 SSL sẽ tự động gia hạn mỗi 12 giờ${NC}"
