# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffpy.structure
pkgshort=diffpy.structure
pkgver=3.2.0
pkgrel=2
pkgdesc="Storage and manipulation of crystal structure data in python"
arch=('any')
url="https://www.diffpy.org/diffpy.structure/"
license=('Open Source Licensce Agreement')

depends=('python'
         'python-six'
         'python-pycifrw>=4.4.3'
         )

makedepends=('python-setuptools' )

provides=('diffpy.structure')

source=(https://github.com/diffpy/diffpy.structure/archive/$pkgver.tar.gz)

package() {
  cd "$srcdir"
  python setup.py install --root="$pkgdir/$pkgshort-$pkgver" --optimize=1
}

md5sums=('b66fe66660108e72897a20d2e8722bd9')
