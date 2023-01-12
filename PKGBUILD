# Maintainer: Matthew Charlston <firstname _at_ mcharlsto dot uk>

pkgname="horizontallyspinningrat"
pkgver=1.0.1
pkgrel=1
depends=("sox")
pkgdesc="The horizontally spinning rat - now on your desktop!"
url="https://github.com/mcharlsto/rat"
arch=("x86_64")
license=("GPL3")
source=("https://github.com/mcharlsto/rat/releases/latest/download/rat")
sha256sums=("SKIP")

package() {
    chmod +x rat
    mkdir -p $pkgdir/usr/bin
    cp ./rat ${pkgdir}/usr/bin/rat
}
