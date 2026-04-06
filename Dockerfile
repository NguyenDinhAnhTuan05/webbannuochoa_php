FROM php:8.2-apache

# Cài đặt các extension cần thiết cho MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

# Bật rewrite module cho Apache (nếu project cần dùng rewrite URL)
RUN a2enmod rewrite

# Copy toàn bộ mã nguồn vào thư mục root của Apache
COPY . /var/www/html/

# Phân quyền cho thư mục web, giúp Apache có thể đọc/ghi được
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
