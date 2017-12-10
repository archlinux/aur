# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgbase=python-pycountry-convert
pkgname=(python-pycountry-convert python2-pycountry-convert)
pkgver=0.6.4
pkgrel=1
pkgdesc="Extension of Python package pycountry providing conversion functions."
arch=('any')
url="http://pypi.python.org/pypi/pycountry-convert"
license=('LGPL3.0')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.io/packages/source/p/${pkgbase#python-}/${pkgbase#python-}-${pkgver}.tar.gz")
sha512sums=('3e60d1c06e36b05125999cb83c2660d7856d533b03ab773bf2a58b1e9b9f99552d219d209b2fe7eae6082b6a2f04004f513a3a958db35a2bbc0674a83fbc3453')

package_python2-pycountry-convert() {
  depends=('python2-pycountry' 'python2-pprintpp')
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-pycountry-convert() {
  depends=('python-pycountry' 'python-pprintpp')
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}
