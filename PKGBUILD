# Maintainer: Matthew Charlston <firstname _at_ mcharlsto dot uk>

pkgname="horizontallyspinningrat"
pkgver=1.0.5
pkgrel=1
depends=("sox" "opusfile" "bash" "sharutils")
optdepends=("lolcat: rainbow mode")
pkgdesc="The horizontally spinning rat - now on your desktop!"
url="https://github.com/mcharlsto/rat"
arch=("x86_64")
license=("GPL3")
source=("https://github.com/mcharlsto/rat/releases/download/${pkgver}/rat")
sha256sums=("SKIP")

package() {
    install -Dm755 rat -t "${pkgdir}/usr/bin/"
}
