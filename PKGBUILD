# Maintainer: Alexis "Horgix" Chotad <alexis.horgix.chotard@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Markus Golser <elmargol@googlemail.com>

_pkgname=mygpoclient
pkgname=python2-$_pkgname
pkgver=1.8
pkgrel=4
pkgdesc="Client library for the my.gpodder.org web service"
arch=('any')
url="https://github.com/gpodder/mygpoclient"
license=('GPL3')
depends=('python2')
conflicts=('python-mygpoclient<=1.5')
source=(https://github.com/gpodder/$_pkgname/archive/$pkgver.tar.gz)
sha256sums=('65fcb3ab220a2ba2d32a77f969b423a2f663413b6c485b7b02e5a955b28e68d2')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
