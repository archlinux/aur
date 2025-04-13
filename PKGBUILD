# Maintainer: aquova <mail at aquova dot com>
pkgname="cbconvert-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="CBconvert is a Comic Book converter"
url="https://github.com/gen2brain/cbconvert"
arch=("x86_64")
license=("GPL3")
source=("${url}/releases/download/v${pkgver}/cbconvert-${pkgver}-linux-x86_64.tar.gz")
sha256sums=("af901b241878cc2378d63768638f099897e4abc5d0f8a98689e99e0e15195135")

package() {
    cd $srcdir/cbconvert-${pkgver}
    install -Dm755 cbconvert $pkgdir/usr/bin/cbconvert
    install -Dm755 cbconvert-gui $pkgdir/usr/bin/cbconvert-gui
}
