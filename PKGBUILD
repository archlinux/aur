# Maintainer: ironcarrier <pidid64@mail.com>
pkgname=iron-tool
pkgver=1.0.0
pkgrel=1
pkgdesc="System administration and security toolkit for Arch Linux"
arch=('any')
url="https://github.com/pidid64-alt/iron-tool"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.sh::$url/raw/main/iron-tool.sh")
b2sums=('SKIP')

package() {
    install -Dm755 "$pkgname-$pkgver.sh" "$pkgdir/usr/bin/iron-tool"
}
