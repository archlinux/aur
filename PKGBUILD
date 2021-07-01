# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-xlsx2csv
pkgver=0.7.8
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
md5sums=('70296d89c84dec9e5da08bed4af14c17')

package() {
  cd "$srcdir/xlsx2csv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
