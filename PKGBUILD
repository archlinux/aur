# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=python-piexif
_pkgname=piexif
pkgver=1.0.1
pkgrel=1
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://pypi.python.org/pypi/piexif#downloads"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.zip")
sha512sums=('6d55795c2aca3aa5ceb484e6549d1b64476abb018410821db8e74bb14a7993d57f8cf5008bfdabedab357ebac3bde682f8a533dfc8a047545423f26764c27eb9')


package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

