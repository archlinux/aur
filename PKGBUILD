# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-xlsx2csv
pkgver=0.7.4
pkgrel=1
pkgdesc="xlsx to csv converter"
arch=(any)
url="https://github.com/dilshod/xlsx2csv"
license=('GPL')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://github.com/dilshod/xlsx2csv/archive/$pkgver.tar.gz)
md5sums=('c1fb8b22936bfb696158fba9bc0fae2e')

package() {
  cd "$srcdir/xlsx2csv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
