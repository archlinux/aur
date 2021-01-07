# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgbase=python-pycountry-convert
pkgname=(python-pycountry-convert python2-pycountry-convert)
pkgver=0.7.2
pkgrel=1
pkgdesc="Extension of Python package pycountry providing conversion functions."
arch=('any')
url="http://pypi.python.org/pypi/pycountry-convert"
license=('LGPL3.0')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.io/packages/source/p/${pkgbase#python-}/${pkgbase#python-}-${pkgver}.tar.gz")
sha512sums=('5010668fcc20e70e035464d69caa0cc3235bc3d913cb0ec759267395ca25d6ffe36800f5c0efc380e0d52c5e7eee35d31471b847072f5253b884a49dfd35a4d7')

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
