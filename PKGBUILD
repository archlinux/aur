# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=grml-iso
pkgver=2017.05
_isover="64-full_$pkgver"
pkgrel=1
pkgdesc="add the grml ISO image to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=('any')
license=('GPL')
depends=('grub' 'grml-rescueboot>=0.4.5')
install="${pkgname}.install"
source=("http://download.grml.org/grml${_isover}.iso")
md5sums=('bd69548cf51fb31bc0b40856569c5b7a')
noextract=(grml${_isover}.iso)

package() {
    install -Dm644 ${srcdir}/grml${_isover}.iso ${pkgdir}/opt/grml/grml${_isover}.iso
}
