# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python-plural'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Python function that returns the needed variation of a word."
arch=('any')
url="https://github.com/kynikos/lib.py.plural"
license=('GPL3')
depends=('python')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.plural/$pkgname-$pkgver.tar.bz2")
sha256sums=('ccce3446ee4e9728912d1395bee4e61ff88ff3230615c96912272de6e05a42da')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
