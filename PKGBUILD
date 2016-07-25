# Maintainer: renek <aur@spaceshore.net>
_pkgname=multidict
pkgname=python-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="A multidict implementation"
arch=('any')
url='https://github.com/aio-libs/multidict'
license=('APACHE')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/aio-libs/multidict/archive/v${pkgver}.tar.gz")
sha512sums=('5a6ec121db9b08707ba1491d39faf35645f48596d69f8ff01ccbd034bed15172bee6f98e8618dd762bf76131735b8453dae9bf29939780029ac2e5bb21b9535b')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
