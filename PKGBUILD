# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=python-pycountry-convert
pkgver=0.7.2
pkgrel=2
pkgdesc="Extension of Python package pycountry providing conversion functions."
arch=('any')
url="http://pypi.python.org/pypi/pycountry-convert"
license=('LGPL3.0')
depends=('python-pycountry' 'python-pprintpp')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/${pkgname#python-}/${pkgname#python-}-${pkgver}.tar.gz")
sha512sums=('5010668fcc20e70e035464d69caa0cc3235bc3d913cb0ec759267395ca25d6ffe36800f5c0efc380e0d52c5e7eee35d31471b847072f5253b884a49dfd35a4d7')

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
