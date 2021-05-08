# Maintainer: GI_Jack <GI_Jack@hackermail.com>
##
## maintaining
pkgname=python-secure02
_pypiname=secure
pkgver=0.2.1
pkgrel=1
pkgdesc="secure.py is a lightweight package that adds optional security headers and cookie attributes for Python web frameworks.(0.2.x API)"
url="https://github.com/TypeError/secure.py/releases"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("python-secure=${pkgver}")
conflicts=('python-secure')

source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/TypeError/secure/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3be83913e23cd7b1710c8a0b84382f5d18bbf25b72d79456a19ab254003ac8fa')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
