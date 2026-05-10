# Maintainer: devome <evinedeng@hotmail.com>

pkgname=php83-cli-static-bin
pkgver=8.3.31
pkgrel=1
pkgdesc="A general-purpose scripting language that is especially suited to web development (8.3.x static precompiled binary)"
arch=("x86_64" "aarch64")
url="https://www.php.net"
license=("PHP-3.01")
provides=(
conflicts=("php83-cli")
source=("php-${pkgver}-cli-build-extensions.json::https://dl.static-php.dev/static-php-cli/bulk/build-extensions.json")
source_x86_64=("php-${pkgver}-cli-linux-x86_64.tar.gz::https://dl.static-php.dev/static-php-cli/bulk/php-${pkgver}-cli-linux-x86_64.tar.gz")
source_aarch64=("php-${pkgver}-cli-linux-aarch64.tar.gz::https://dl.static-php.dev/static-php-cli/bulk/php-${pkgver}-cli-linux-aarch64.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
options=(!strip)

package() {
    install -Dm755 php "${pkgdir}/usr/bin/php83" 
}
