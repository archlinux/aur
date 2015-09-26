# Maintainer: Simon Chabot <simon dot chabot at etu dot utc dot fr>
pkgname=exifread
_pkgname=ExifRead
pkgver=2.1.2
pkgrel=1
pkgdesc="Python library to extract EXIF data from tiff and jpeg files"
arch=('any')
url="https://pypi.python.org/pypi/ExifRead/"
license=('BSD')
depends=('python3')
provides=('exifread=2.1.2')
source=(https://pypi.python.org/packages/source/E/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('8f5099e11e2137e0ce5acbec91c219be')


package() {
	cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
