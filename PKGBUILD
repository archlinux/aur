# Maintainer: pcrab <pcrab at pcrab dot xyz>

pkgname=alire-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="Command-line tool from the Alire project and supporting library "
url="https://github.com/alire-project/alire"
arch=("x86_64")
license=("GPL-3.0")

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/alire-project/alire/releases/download/v${pkgver}/alr-${pkgver}-bin-x86_64-linux.zip"
)
sha256sums=(
    "579de127341a1a684e07410b8b7a15ea7c2b39c47fd1a21179202203afe4be23"
)

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm755 "${srcdir}/bin/alr" "${pkgdir}/usr/bin/alr"
}
