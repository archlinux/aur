# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffpy.structure
pkgshort=diffpy.structure
pkgver=3.0.1
pkgrel=1
pkgdesc="Storage and manipulation of crystal structure data in python"
arch=('any')
url="https://www.diffpy.org/diffpy.structure/"
license=('Open Source Licensce Agreement')

depends=('python'
         'python-six'
         'python-pycifrw>=4.2'
         )

makedepends=('python-setuptools' )

provides=('diffpy.structure')

source=(https://github.com/diffpy/diffpy.structure/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('639ee82485190cbcf92e0ef7a2cf1ba7')
