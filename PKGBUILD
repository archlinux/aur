# Maintainer: user20159 <public[aT]lrose.de>

pkgbase='bspacr-git'
_pkgname='BSpacr'
pkgname='bspacr-git'
pkgver='1.2.0'
pkgrel=1
pkgdesc="LV2 effect plugin suited for any kind of music with zero latency"
url="https://github.com/sjaehn/BSpacr"
depends=('libx11' 'cairo' 'lv2')
license=('GPL3')
arch=('x86_64')
source=("git+https://github.com/sjaehn/BSpacr")
sha512sums=('SKIP')

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    PREFIX="$pkgdir/usr/" make install
}

