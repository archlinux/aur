# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python2-plural'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Python2 function that returns the needed variation of a word."
arch=('any')
url="https://github.com/kynikos/lib.py.plural"
license=('GPL3')
depends=('python2')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.plural/$pkgname-$pkgver.tar.bz2")
sha256sums=('b3b38a84a27078d97ca2f0eb3884aee8f85d9eff2dd7146ef28d6fb26917a76d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
