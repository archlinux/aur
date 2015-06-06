# Constributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=('php-requests')
_pkgname=Requests
pkgver=1.6.1
pkgrel=1
pkgdesc="PHP library to make HTTP requests"
arch=('any')
url="http://requests.ryanmccue.info/"
license=('custom:ISC')
depends=('php>=5.2')

source=(https://github.com/rmccue/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('ec456cb7781e5bb81768d5e534952562b697172db1af651112f044ad8cf5afd5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/pear/
  cp -r library/Requests library/Requests.php $pkgdir/usr/share/pear/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
