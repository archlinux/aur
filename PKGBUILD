# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname='python-pyelectronics'
_pkgname=pyelectronics
pkgver=0.1.4
pkgrel=1
pkgdesc="A library for working with electronics"
arch=('any')
url="https://github.com/MartijnBraam/pyElectronics"
license=('MIT')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
depends=('python')
makedepends=('python-setuptools')
md5sums=('40de074d29d8b4edb72707614adf7a41')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

