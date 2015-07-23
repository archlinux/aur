# Maintainer: Simon Chabot <simon dot chabot at etu dot utc dot fr>
pkgname=exifread
_pkgname=ExifRead
pkgver=2.1.1
pkgrel=1
pkgdesc="Python library to extract EXIF data from tiff and jpeg files"
arch=('any')
url="https://pypi.python.org/pypi/ExifRead/"
license=('BSD')
depends=('python3')
provides=('exifread=2.1.1')
source=(https://pypi.python.org/packages/source/E/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('1ad3338c0f2cf3e3d9e90e6b33db5754')


package() {
	cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
