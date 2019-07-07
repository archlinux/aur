# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=python2-piexif
_pkgname=piexif
pkgver=1.1.3
pkgrel=1
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://pypi.python.org/pypi/piexif#downloads"
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.zip")
sha512sums=('df5f7793c39911af58bbae76cf998e2a7bc820b84dcf9808ee8f6a38f766f824fef28392ef88387e18b10c270c4b27881be310f0368076b6fb65379a11a93270')


package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

