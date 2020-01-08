# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.4.1
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python')
makedepends=('python3' 'python-setuptools')
license=('')
arch=('any')
source=("https://github.com/tulir/mautrix-python/archive/v${pkgver}.tar.gz")
sha256sums=('b823cf09d7fc701635814d10997f77d91ffd8153316c59d67b015ba9637499cb')

build() {
    cd mautrix-python-${pkgver}
    python setup.py build
}

package() {
    cd mautrix-python-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
