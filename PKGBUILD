# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-secure
_pypiname=secure.py
pkgver=0.2.1
pkgrel=1
pkgdesc="secure.py is a lightweight package that adds optional security headers and cookie attributes for Python web frameworks."
url="https://github.com/TypeError/secure.py/releases"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/TypeError/secure.py/archive/v${pkgver}.tar.gz")
sha256sums=('20ccb7a9f55a58e572b14fb68ec49344bbbc8574debf288caa630d0fc8f29b3c')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
