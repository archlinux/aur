# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-piexif
_pyname=piexif
pkgname=('python-piexif' 'python2-piexif')
makedepends=('python' 'python2' 'python2-setuptools' 'python-setuptools')
pkgver=1.0.4
pkgrel=1
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://pypi.python.org/pypi/piexif#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/81/4c/f1a0fc870527920e9deb70d8b4814e4a183f9fece096934751f387785f2d/piexif-${pkgver}.zip")
sha512sums=('862d4048c67b603098c474ffca014e8513acb163ede177aca83250940e7540caa47ff428d7de9ad3efdef433c7ba1e1e3011389e9a950e473dafef90ff7214a4')

package_python-piexif() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-piexif() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
