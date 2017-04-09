# Maintainer: Armin Fisslthaler <armin@fisslthaler.net>
pkgname=pyxtrlock
pkgver=0.2
pkgrel=2
pkgdesc="The X transparent screen lock rewritten in Python."
arch=('any')
url="https://zombofant.net/hacking/pyxtrlock"
license=('GPLv3+')
depends=('python3' 'python-simplepam')
source=(https://github.com/leonnnn/pyxtrlock/archive/$pkgver.tar.gz)
md5sums=('207e5da924ef3ec881e9d6b8f7577220')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

