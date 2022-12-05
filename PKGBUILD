# Maintainer: Lessaire Mightyhigh <archuserrepo at pink dot horse>
# Prev Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=grml-iso
pkgver=2022.11
_isover="64-full_$pkgver"
pkgrel=1
pkgdesc="add the grml ISO image to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=('any')
license=('GPL')
depends=('grub' 'grml-rescueboot>=0.5.0')
install="${pkgname}.install"
source=("http://download.grml.org/grml${_isover}.iso")
sha256sums=('8b8e4a548a7dcdcd8f3e93098e740c012b5427cf5f4bc5730ef428a6feddd877')
noextract=(grml${_isover}.iso)

package() {
    install -Dm644 ${srcdir}/grml${_isover}.iso ${pkgdir}/opt/grml/grml${_isover}.iso
}
