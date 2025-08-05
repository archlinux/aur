# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=litproxy
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc='Modern, Easy-to-Use Python Proxy Management Library'
arch=(any)
url="https://github.com/OEvortex/Webscout"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/00/f9/b32cc58e7f2833f97fae3af8844c791969bb2b6cb790e13ff23686eb92c9/litproxy-0.2.0.tar.gz")
sha256sums=(5621f8f69474d4272419c3543f01b2b66f2df80b021126f549d74c5713c9ba2f)

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

# vim:set ts=2 sw=2 et:
