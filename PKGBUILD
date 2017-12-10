# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgbase=python-pprintpp
pkgname=(python-pprintpp python2-pprintpp)
pkgver=0.3.0
pkgrel=1
pkgdesc="Extension of Python package pycountry providing conversion functions."
arch=('any')
url="http://pypi.python.org/pypi/pprintpp"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.io/packages/source/p/${pkgbase#python-}/${pkgbase#python-}-${pkgver}.tar.gz")
sha512sums=('3c65bc60d4cc4ef8a876b30e1005894b094b2d28fcd79372093cd1a512ec68059e48557fdb5765a7a2b2c1ada2bdd718ff79a936454a7ae99665c3a1935e2350')

package_python2-pprintpp() {
  depends=('python2')
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-pprintpp() {
  depends=('python')
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}
