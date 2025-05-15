# Maintainer: Max Roder <maxroder@mailbox.org>
# Prev Maintainer: Xaekai <archuserrepo at pink dot horse>
# Prev Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=grml-iso
pkgver=2025.05
_isover="-full-$pkgver-amd64"
pkgrel=1
pkgdesc="provides the grml ISO image for usage by grml-rescueboot"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=('any')
license=('GPL')
depends=('grub' 'grml-rescueboot>=0.5.0')
install="${pkgname}.install"
source=("http://download.grml.org/grml${_isover}.iso")
sha256sums=('8ddf650a98c12406e5976243d8ebac3796a00f86e198ab1a2b70755ce90c7365')
noextract=(grml${_isover}.iso)

package() {
    install -Dm644 ${srcdir}/grml${_isover}.iso ${pkgdir}/opt/grml/grml${_isover}.iso
}
