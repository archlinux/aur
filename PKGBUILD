# Maintainer: pcrab <pcrab at pcrab dot xyz>

pkgname=alire-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Command-line tool from the Alire project and supporting library "
url="https://github.com/alire-project/alire"
arch=("x86_64")
license=("GPL-3.0")

provides=("alire=${pkgver}")
conflicts=("alire")

source=(
    "${pkgname}_${pkgver}.zip::https://github.com/alire-project/alire/releases/download/v${pkgver}/alr-${pkgver}-bin-x86_64-linux.zip"
)
sha256sums=(
    "09c66bcd8c35dd4b97b72c3d9b76e44caa6964a2db35aba069f396f00f1f64c7"
)

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm755 "${srcdir}/bin/alr" "${pkgdir}/usr/bin/alr"
}
