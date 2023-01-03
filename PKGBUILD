# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffpy.structure
pkgshort=diffpy.structure
pkgver=3.1.0
pkgrel=1
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

source=(https://github.com/diffpy/diffpy.structure/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('98bacacd1785ea0a85ae5db19d7f4bf4')
