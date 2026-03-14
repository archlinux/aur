# Maintainer: pcrab <pcrab at pcrab dot xyz>

pkgname=alire-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Command-line tool from the Alire project and supporting library "
url="https://github.com/alire-project/alire"
arch=("x86_64")
license=("GPL-3.0")

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/alire-project/alire/releases/download/v${pkgver}/alr-${pkgver}-bin-x86_64-linux.zip"
)
sha256sums=(
    "e3b32cb0afe981b23d1a68da77452cf81ee1d82de8ebaf01c5e233be8b463fbe"
)

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm755 "${srcdir}/bin/alr" "${pkgdir}/usr/bin/alr"
}
