# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgbase=python-piexif
_pkgname=piexif
pkgname=('python-piexif' 'python2-piexif')
pkgver=1.0.1
pkgrel=2
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://pypi.python.org/pypi/piexif#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.zip")
sha512sums=('6d55795c2aca3aa5ceb484e6549d1b64476abb018410821db8e74bb14a7993d57f8cf5008bfdabedab357ebac3bde682f8a533dfc8a047545423f26764c27eb9')

package_python-piexif() {
  depends=('python')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-piexif() {
  depends=('python2')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set ts=2 sw=2 et:

