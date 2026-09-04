# Maintainer: Max Roder <maxroder@mailbox.org>
# Prev Maintainer: Xaekai <archuserrepo at pink dot horse>
# Prev Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=grml-iso
pkgver=2026.09
_isover="-full-$pkgver-amd64"
pkgrel=1
pkgdesc="provides the grml ISO image for usage by grml-rescueboot"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=('any')
license=('GPL')
depends=('grub' 'grml-rescueboot>=0.5.0')
install="${pkgname}.install"
source=("http://download.grml.org/grml${_isover}.iso")
sha256sums=('76e8019ff1b68ddb3e49cecb1ea35ecead9e0f1c1ba22c0e819c9b13de939e72')
noextract=(grml${_isover}.iso)

package() {
    install -Dm644 ${srcdir}/grml${_isover}.iso ${pkgdir}/opt/grml/grml${_isover}.iso
}
