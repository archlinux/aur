# Maintainer: ironcarrier <pidid64@mail.com>
pkgname=iron-tool
pkgver=1.0.1
pkgrel=1
pkgdesc="System administration and security toolkit for Arch Linux"
arch=('any')
url="https://github.com/pidid64-alt/iron-tool"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.sh::$url/raw/main/iron-tool.sh")
b2sums=('b367492d5a89f4911733300595a5fd471a72933faa74d0fbc1fb171d3d7aa23ce0596793c6569046985fa49d7adaa0e3f229108bec56b8b9da3a59e2e284da05')

package() {
    install -Dm755 "$pkgname-$pkgver.sh" "$pkgdir/usr/bin/iron-tool"
}
