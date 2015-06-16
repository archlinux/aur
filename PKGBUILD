# Contributor: Esclapion <esclapion@gmail.com>

pkgname=iceglass-light
pkgver=1
pkgrel=1
pkgdesc="Iceclass lightened, for Lxqt and Kde"
arch=('any')
license=('GPL')
url=('http://kde-look.org/content/show.php/Iceglass?content=121145')
source=(http://esclapion.free.fr/AUR/${pkgname}-${pkgver}.${pkgrel}.tar.gz)
md5sums=('46f87c2069029aa28bf9093301f43a6d')

package() {
  mkdir -p ${pkgdir}/usr/share/icons/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/icons/
}
