# Maintainer: devome <evinedeng@hotmail.com>

pkgname=php83-cli-static-bin
pkgver=8.3.19
pkgrel=1
pkgdesc="A general-purpose scripting language that is especially suited to web development (8.3.x static precompiled binary)"
arch=("x86_64" "aarch64")
url="https://www.php.net"
license=("PHP-3.01")
provides=(
    "php83-cli"
    "php83-acpu"
    "php83-bcmath"
    "php83-bz2"
    "php83-calendar"
    "php83-ctype"
    "php83-curl"
    "php83-dba"
    "php83-dom"
    "php83-event"
    "php83-exif"
    "php83-fileinfo"
    "php83-filter"
    "php83-ftp"
    "php83-gd"
    "php83-gmp"
    "php83-iconv"
    "php83-imagick"
    "php83-imap"
    "php83-intl"
    "php83-mbstring"
    "php83-mbregex"
    "php83-mysqlnd"
    "php83-mysqli"
    "php83-opcache"
    "php83-openssl"
    "php83-pcntl"
    "php83-pdo"
    "php83-pdo_mysql"
    "php83-pgsql"
    "php83-phar"
    "php83-posix"
    "php83-protobuf"
    "php83-readline"
    "php83-redis"
    "php83-session"
    "php83-shmop"
    "php83-simplexml"
    "php83-soap"
    "php83-sockets"
    "php83-sodium"
    "php83-sqlite"
    "php83-swoole"
    "php83-swoole-hook-pgsql"
    "php83-swoole-hook-mysql"
    "php83-swoole-hook-sqlite"
    "php83-sysvmsg"
    "php83-sysvsem"
    "php83-sysvshm"
    "php83-tokenizer"
    "php83-xml"
    "php83-xmlreader"
    "php83-xmlwriter"
    "php83-xsl"
    "php83-zip"
    "php83-zlib"
)
conflicts=("php83-cli")
source_x86_64=("https://dl.static-php.dev/static-php-cli/bulk/php-${pkgver}-cli-linux-x86_64.tar.gz")
source_aarch64=("https://dl.static-php.dev/static-php-cli/bulk/php-${pkgver}-cli-linux-aarch64.tar.gz")
sha256sums_x86_64=('4358dfe846d7e0218ca92a50cf62e17e62ef9c15e04cc23798f9b3ff5c9a0e66')
sha256sums_aarch64=('1a87b12f9458e0f75dc659112e434758083e3d5f0d65369da3d331110c75e730')
options=(!strip)

package() {
    install -Dm755 php "${pkgdir}/usr/bin/php83" 
}
