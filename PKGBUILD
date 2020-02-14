# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.4.2
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python')
makedepends=('python3' 'python-setuptools')
license=('')
arch=('any')
source=("https://files.pythonhosted.org/packages/7e/c6/f682baab2adcc79d3fcb9767b593aa0b67a35723eee8abb5fe2dba42ea61/mautrix-${pkgver}.tar.gz")
sha256sums=('cfe3cf8e33c0082f1f5a4fcbfa0c1f9a50cdcb7db9a7662c3c57a01b4ffc1739')

build() {
    cd mautrix-${pkgver}
    python setup.py build
}

package() {
    cd mautrix-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
