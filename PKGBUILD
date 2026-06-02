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
b2sums=('0363c5f68c7712a55ebc0fb52788a889545c7ea4cc065f3cdb21c17e30b507b3da5ed09fa5771efe04548d9f78a26f19f3497b2a8b12103c6599b9fdd10234f1')

package() {
    install -Dm755 "$pkgname-$pkgver.sh" "$pkgdir/usr/bin/iron-tool"
}
