# Contributor: Esclapion <esclapion@gmail.com>

pkgname=db-silver-icons
pkgver=1.3
pkgrel=1
pkgdesc="Icon theme gray for Lxqt and Kde containig part of oxygen"
arch=('any')
license=('GPL')
url=('http://kde-look.org/content/show.php/DB+Silver+Icons?content=157154')
source=(http://esclapion.free.fr/AUR/${pkgname}-${pkgver}.tar.gz)
md5sums=('5ed30430313e60efff21b5dbea8bedfe')

package() {
  mkdir -p ${pkgdir}/usr/share/icons/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/icons/
}

