# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-matplotlib-scalebar
pkgshort=matplotlib-scalebar
pkgver=0.7.2
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

md5sums=('f2bd08321cc1b1d9dfe99392a18a42fb')
