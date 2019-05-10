# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-metadata
pkgver=1.8.0
pkgrel=1
pkgdesc="Pytest plugin for accessing test session metadata"
url="https://github.com/pytest-dev/pytest-metadata"
arch=('any')
license=('MPL2')
depends=('python-pytest>=2.9.0')
source=(
  "https://files.pythonhosted.org/packages/source/p/pytest-metadata/pytest-metadata-$pkgver.tar.gz"
)
sha256sums=(
  "2071a59285de40d7541fde1eb9f1ddea1c9db165882df82781367471238b66ba"
)

build() {
    cd "pytest-metadata-$pkgver"
    python setup.py build
}

package() {
    cd "pytest-metadata-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
