# Maintainer: Shuyuan Liu <liu_shuyuan at qq dot com>

pkgname=pixd
pkgver=1.0.0
pkgrel=1
pkgdesc='Colourful visualization tool for binary files'
arch=('x86_64')
url='https://github.com/FireyFly/pixd'
license=('MIT')

depends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FireyFly/pixd/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('55df5a553a9a9e4a3d726bcfa255ea6c3a47fb11')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
