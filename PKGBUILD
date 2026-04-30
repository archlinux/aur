pkgname=n3426
pkgver=0.1.0
pkgrel=1
pkgdesc="A neon-themed markdown and media vault"
arch=('any')
url="https://github.com/7gto/n3426"
license=('MIT')
depends=('pyside6')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/7gto/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') # You'd generate this later

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}