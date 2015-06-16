# Author: esclapion <esclapion[at]gmail[dot]com>
# Maintainer: esclapion <esclapion[at]gmail[dot]com>

pkgname=qisousb
pkgver=1.1
pkgrel=1
pkgdesc="A graphical Qt tool to copy a hybrid ISO onto a USB key."
url="http://forum.manjaro.org/index.php?topic=3682"
arch=('any')
license=('GPL')
depends=('qarma-git' 'gksu')
optdepends=()
source=("qisousb-$pkgver.tar.gz")
sha1sums=('b688ceec5f1a745e941b76d88e77a0e68b7136cc')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

