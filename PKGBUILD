# Maintainer: James An <james@jamesan.ca>

pkgname=python-pyjslint
_pkgname=pyjslint
pkgver=0.3.4
pkgrel=2
pkgdesc='JSLint wrapper for Python'
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('BSD')
depends=('nodejs' 'python')
makedepends=('python-setuptools')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cb8a0aa4edf470f04cd058e33994997b')

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
