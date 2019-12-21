# Maintainer: Armin Fisslthaler <armin@fisslthaler.net>
pkgname=pyxtrlock
pkgver=0.4
pkgrel=3
pkgdesc="The X transparent screen lock rewritten in Python."
arch=('any')
url="https://zombofant.net/hacking/pyxtrlock"
license=('GPLv3+')
depends=('python3' 'python-simplepam' 'python-xdg')
makedepends=('python-setuptools')
source=(https://github.com/leonnnn/pyxtrlock/archive/$pkgver.tar.gz)
sha256sums=('f8dbc3eade2b70cb8dea20ce19f0f1c5a192bd8219082cb116b79c6859716e29')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

