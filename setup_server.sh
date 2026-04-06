#!/bin/bash
# =============================================================================
# SCRIPT CÀI ĐẶT MÔI TRƯỜNG SERVER CHO WEBBANNUOCHOA
# Chạy lệnh này MỘT LẦN DUY NHẤT trên server trước khi dùng CI/CD
# Hỗ trợ: Ubuntu 20.04 / 22.04 / Debian 11+
#
# Cách dùng:
#   chmod +x setup_server.sh
#   sudo bash setup_server.sh
# =============================================================================

set -e

# ── Màu sắc terminal ──────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info()    { echo -e "${BLUE}[INFO]${NC}  $1"; }
log_success() { echo -e "${GREEN}[OK]${NC}    $1"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC}  $1"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo ""
echo "============================================"
echo "  🚀 SETUP SERVER - WEBBANNUOCHOA"
echo "============================================"
echo ""

# ── Kiểm tra quyền root ───────────────────────────────────────────────────────
if [ "$EUID" -ne 0 ]; then
  log_error "Vui lòng chạy với quyền root: sudo bash setup_server.sh"
fi

# ── Cập nhật hệ thống ─────────────────────────────────────────────────────────
log_info "Cập nhật danh sách package..."
apt-get update -y
log_success "Đã cập nhật package list"

# ── Cài các package cần thiết ────────────────────────────────────────────────
log_info "Cài đặt các công cụ cần thiết (git, curl, ca-certificates)..."
apt-get install -y \
  git \
  curl \
  wget \
  ca-certificates \
  gnupg \
  lsb-release \
  ufw
log_success "Đã cài xong các công cụ cơ bản"

# ── Cài Docker ────────────────────────────────────────────────────────────────
if command -v docker &> /dev/null; then
  log_warn "Docker đã được cài: $(docker --version)"
else
  log_info "Đang cài đặt Docker Engine..."

  # Thêm Docker GPG key
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  chmod a+r /etc/apt/keyrings/docker.gpg

  # Thêm Docker repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null

  apt-get update -y
  apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Khởi động Docker
  systemctl enable docker
  systemctl start docker

  log_success "Đã cài Docker: $(docker --version)"
fi

# ── Kiểm tra Docker Compose ───────────────────────────────────────────────────
if command -v docker-compose &> /dev/null; then
  log_success "Docker Compose v1 đã có: $(docker-compose --version)"
elif docker compose version &> /dev/null; then
  log_success "Docker Compose v2 đã có: $(docker compose version)"
else
  log_info "Cài Docker Compose v2 plugin..."
  apt-get install -y docker-compose-plugin
  log_success "Đã cài Docker Compose"
fi

# ── Kiểm tra Docker chạy được ─────────────────────────────────────────────────
log_info "Kiểm tra Docker hoạt động..."
docker run --rm hello-world > /dev/null 2>&1 && log_success "Docker hoạt động bình thường!" || log_warn "Docker hello-world thất bại, kiểm tra lại."

# ── Cấu hình Firewall ─────────────────────────────────────────────────────────
log_info "Cấu hình firewall (UFW)..."
ufw allow 22/tcp    # SSH
ufw allow 80/tcp    # HTTP
ufw allow 443/tcp   # HTTPS
ufw allow 3306/tcp  # MySQL (chỉ nếu cần truy cập từ ngoài - xem xét bỏ dòng này cho bảo mật)
ufw --force enable
log_success "Firewall đã cấu hình: port 22, 80, 443 mở"

# ── Tạo thư mục deploy ───────────────────────────────────────────────────────
DEPLOY_DIR="/var/www/webbannuochoa"
log_info "Tạo thư mục deploy: $DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"
log_success "Thư mục $DEPLOY_DIR đã sẵn sàng"

# ── Tạo SSH key cho Deploy (nếu chưa có) ─────────────────────────────────────
SSH_KEY_PATH="$HOME/.ssh/id_rsa_deploy"
if [ ! -f "$SSH_KEY_PATH" ]; then
  log_info "Tạo SSH key pair cho GitHub Actions..."
  ssh-keygen -t rsa -b 4096 -C "github-actions-deploy" -f "$SSH_KEY_PATH" -N ""
  log_success "Đã tạo SSH key tại: $SSH_KEY_PATH"
else
  log_warn "SSH key đã tồn tại: $SSH_KEY_PATH"
fi

# Thêm public key vào authorized_keys (để GitHub Actions SSH được vào)
PUB_KEY=$(cat "${SSH_KEY_PATH}.pub")
AUTHORIZED_FILE="$HOME/.ssh/authorized_keys"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if ! grep -qF "$PUB_KEY" "$AUTHORIZED_FILE" 2>/dev/null; then
  echo "$PUB_KEY" >> "$AUTHORIZED_FILE"
  chmod 600 "$AUTHORIZED_FILE"
  log_success "Đã thêm public key vào authorized_keys"
else
  log_warn "Public key đã tồn tại trong authorized_keys"
fi

# ── In ra thông tin cần thiết ─────────────────────────────────────────────────
echo ""
echo "============================================"
echo -e "${GREEN}  ✅ CÀI ĐẶT HOÀN TẤT!${NC}"
echo "============================================"
echo ""
echo -e "${YELLOW}📋 BƯỚC TIẾP THEO - Cấu hình GitHub Secrets:${NC}"
echo ""
echo "─── SERVER_SSH_KEY (copy toàn bộ nội dung bên dưới) ───────────────"
cat "$SSH_KEY_PATH"
echo ""
echo "────────────────────────────────────────────────────────────────────"
echo ""
echo "Thêm các secrets sau vào GitHub:"
echo "  → Repository → Settings → Secrets and variables → Actions"
echo ""
echo "  SERVER_HOST       = $(hostname -I | awk '{print $1}')"
echo "  SERVER_USERNAME   = $(whoami)"
echo "  SERVER_PORT       = 22"
echo "  SERVER_SSH_KEY    = <nội dung private key bên trên>"
echo "  DB_USER           = root"
echo "  DB_PASS           = (mật khẩu database bạn muốn dùng)"
echo "  DB_NAME           = webbanhang"
echo "  GEMINI_API_KEY    = (API key Gemini của bạn, để trống nếu không dùng)"
echo ""
echo "============================================"
