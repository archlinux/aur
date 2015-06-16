# Maintainer: Esclapion <esclapion[à]gmail.com>

pkgname=isousb
pkgver=1.5
pkgrel=1
pkgdesc="A graphical tool to copy a hybrid ISO onto a USB key."
url="http://forum.manjaro.org/index.php?topic=3682"
arch=('any')
license=('GPL')
depends=('zenity' 'gksu')
optdepends=()
source=(http://esclapion.free.fr/AUR/${pkgname}-${pkgver}.tar.gz)
sha1sums=('8ed1b0b8feccc626bd9e065435a9cf18c0eef6fe')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
