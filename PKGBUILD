# Maintainer: aquova <mail at aquova dot com>
pkgname="cbconvert-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="CBconvert is a Comic Book converter"
url="https://github.com/gen2brain/cbconvert"
arch=("x86_64")
license=("GPL3")
source=("${url}/releases/download/v${pkgver}/cbconvert-${pkgver}-linux-x86_64.tar.gz")
sha256sums=("4d094bafbc0ca0d3a175faf550248fce2d842f9db194d5888cabd27438e54dc4")

package() {
    cd $srcdir/cbconvert-${pkgver}
    install -Dm755 cbconvert $pkgdir/usr/bin/cbconvert
    install -Dm755 cbconvert-gui $pkgdir/usr/bin/cbconvert-gui
}
