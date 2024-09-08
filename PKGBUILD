# Maintainer: pcrab <pcrab at pcrab dot xyz>

pkgname=alire-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="Command-line tool from the Alire project and supporting library "
url="https://github.com/alire-project/alire"
arch=("x86_64")
license=("GPL-3.0")

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/alire-project/alire/releases/download/v${pkgver}/alr-${pkgver}-bin-x86_64-linux.zip"
)
sha256sums=(
    "8f4b39f42fd6969815077f91fdae087b8309eedda069ad5227374c49807792a1"
)

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm755 "${srcdir}/bin/alr" "${pkgdir}/usr/bin/alr"
}
