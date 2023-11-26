# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=0.3.7
pkgrel=1
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
depends=('rust')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08514e4b1719bc2f57c6bbfbd0f6f69caee08126af7d27ad5d37ef710d8d1426')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
