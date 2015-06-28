# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=grml-iso
pkgver=2014.11
_isover="64-full_$pkgver"
pkgrel=1
pkgdesc="add the grml ISO image to the grub2 boot menu"
url="http://wiki.grml.org/doku.php?id=rescueboot"
arch=('any')
license=('GPL')
depends=('grub' 'grml-rescueboot>=0.4.5')
install="${pkgname}.install"
source=("http://download.grml.org/grml${_isover}.iso")
md5sums=('51ca23d8335732150f31c021eafc6513')
noextract=(grml${_isover}.iso)

package() {
    install -Dm644 ${srcdir}/grml${_isover}.iso ${pkgdir}/opt/grml/grml${_isover}.iso
}
