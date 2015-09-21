# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgbase=python-requests-cache
_pyname=requests-cache
pkgname=('python-requests-cache' 'python2-requests-cache')
makedepends=('python' 'python2')
pkgver=0.4.10
pkgrel=1
pkgdesc="Persistent cache for requests library"
arch=('any')
url="https://pypi.python.org/pypi/requests-cache#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/source/r/$_pyname/$_pyname-$pkgver.zip")
sha512sums=('1ddb9becb15d5ad580b90d297bd078fa0c154a382777b1a0d72bbd4fd5b1e47d56bd41d5220c1d0e66521b69800c9730af6d9b7261f97a907bd05f628754fe05')

package_python-requests-cache() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-requests-cache() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set ts=2 sw=2 et:

