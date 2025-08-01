# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=python-json-cmd-server
pkgver=1.1.0
pkgrel=1
pkgdesc="Library for creating a json based server/client application"
url="https://gitlab.com/NikolasK-source-pythonlib/json-command-server"
license=('GPLv3')
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-cryptography')
source=("git+https://gitlab.com/NikolasK-source-pythonlib/json-command-server.git#tag=v${pkgver}")

sha256sums=('SKIP')

build() {
    cd json-command-server
    python setup.py build
}

package() {
    cd json-command-server
    python setup.py install --root="$pkgdir" --optimize=1
}
