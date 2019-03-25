# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Tim Diels <youremail@domain.com>

pkgname=python2-xlsx2csv
pkgver=0.7.6
pkgrel=1
pkgdesc="xlsx to csv converter"
arch=(any)
url="https://github.com/dilshod/xlsx2csv"
license=('GPL')
depends=('python2')
options=(!emptydirs)
source=(https://github.com/dilshod/xlsx2csv/archive/$pkgver.tar.gz)
md5sums=('e1f585ed3c2f90e419c2e8d1efd46d76')

package() {
  cd "$srcdir/xlsx2csv-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
