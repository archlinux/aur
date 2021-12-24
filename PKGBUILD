# Maintainer: Lessaire Mightyhigh <archuserrepo at pink dot horse>
# Prev Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=grml-iso
pkgver=2021.07
_isover="64-full_$pkgver"
pkgrel=1
pkgdesc="add the grml ISO image to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=('any')
license=('GPL')
depends=('grub' 'grml-rescueboot>=0.5.0')
install="${pkgname}.install"
source=("http://download.grml.org/grml${_isover}.iso")
sha256sums=('7cec5cb3816edd55164d8d1cdfc315ecdda1ea26e5daa52fc8462f8d5bdd888d')
noextract=(grml${_isover}.iso)

package() {
    install -Dm644 ${srcdir}/grml${_isover}.iso ${pkgdir}/opt/grml/grml${_isover}.iso
}
