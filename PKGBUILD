pkgname=python2-typing
pkgver=3.6.1
pkgrel=1
pkgdesc="Type Hints for Python"
url=" https://docs.python.org/3/library/typing.html"
arch=('any')
license=('PSF')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/17/75/3698d7992a828ad6d7be99c0a888b75ed173a9280e53dbae67326029b60e/typing-3.6.1.tar.gz")
md5sums=('3fec97415bae6f742fb3c3013dedeb89')

build() {
  cd "${srcdir}"/typing-$pkgver
  python2 setup.py build
}

package() {
  depends=('python2')

  cd "${srcdir}/typing-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

