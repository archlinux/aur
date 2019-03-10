# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/8d/aa/41ecccdbf9a0b1a5f9a9cc54fc72e4744eb6b86ed73bc4b3ca941cad945d/wasabi-0.1.2.tar.gz")
sha256sums=('1a2ba97e2d960a25cba876806501f2dc68f74470ccef324c0d7aaf82a25a7422')

build(){
    cd "wasabi-${pkgver}"
    python setup.py build
}

package(){
    cd "wasabi-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
