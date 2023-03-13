# Maintainer: Matthew Charlston <firstname _at_ mcharlsto dot uk>

pkgname="horizontallyspinningrat"
pkgver=1.1
pkgrel=1
depends=("sox" "opusfile" "bash" "sharutils")
optdepends=("lolcat: rainbow mode")
pkgdesc="The horizontally spinning rat - now on your desktop!"
url="https://github.com/mcharlsto/rat"
arch=("x86_64")
license=("GPL3")
source=("https://github.com/mcharlsto/rat/releases/download/${pkgver}/rat")
sha256sums=('f77b2ca63bd714fa1c1853de085d405a8598c79848eef325b71f5243bc76e73e')

package() {
    install -Dm755 rat -t "${pkgdir}/usr/bin/"
}
