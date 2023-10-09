FROM php:7.4-fpm-alpine

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN apk update && apk add \
    build-base \
    zip \
    vim \
    unzip \
    git \
    curl \
    libzip-dev

# Install extensions
RUN docker-php-ext-install pdo_mysql

# Add user for laravel application
RUN addgroup -g 1000 -S www && \
    adduser -u 1000 -S www -G www

# Change current user to www
USER www

# Copy existing application directory permissions
COPY --chown=www:www ./webapp /var/www/html

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
