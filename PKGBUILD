# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-matplotlib-scalebar
pkgshort=matplotlib-scalebar
pkgver=0.8.0
pkgrel=1
pkgdesc="Provides a new artist for matplotlib to display a scale bar, aka micron bar."
arch=('any')
url="https://github.com/ppinard/matplotlib-scalebar"
license=('BSD 2-Clause')

depends=('python'
         'python-matplotlib'
         )

makedepends=('python-setuptools' )

provides=('matplotlib-scalebar')

source=(https://github.com/ppinard/matplotlib-scalebar/archive/refs/tags/$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('65a34f180864a28183f35e9ec1fe8876')
