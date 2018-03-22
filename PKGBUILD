# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=dmenu-lpass
pkgver=v0.1.0
pkgrel=1
pkgdesc="dmenu script for lastpass-cli"
arch=("any")
url="https://github.com/va7sdf/dmenu-lpass"
license=("unknown")
depends=("bash" "lastpass-cli" "awk" "dmenu")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("764f883842235d6d6f1fb0475f487b550ec700760fa09c38cebefc4613e67b0f")

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$pkgname-$pkgver/dmenu-lpass.sh" "$pkgdir/usr/bin/dmenu-lpass"
}

