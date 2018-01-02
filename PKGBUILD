# Maintainer: Alexis "Horgix" Chotad <alexis.horgix.chotard@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Markus Golser <elmargol@googlemail.com>

_pkgname=mygpoclient
pkgname=python2-$_pkgname
pkgver=1.7
pkgrel=4
pkgdesc="Client library for the my.gpodder.org web service"
arch=('any')
url="https://github.com/gpodder/mygpoclient"
license=('GPL3')
depends=('python2')
conflicts=('python-mygpoclient<=1.5')
source=(https://pypi.python.org/packages/source/m/mygpoclient/mygpoclient-1.7.tar.gz)
#source=(http://thpinfo.com/2010/mygpoclient/mygpoclient-$pkgver.tar.gz)
md5sums=('fc4e237c40eba0733a362949d304974c')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
