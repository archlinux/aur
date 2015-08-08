# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python-configfile'
pkgver='1.2.0'
pkgrel=1
pkgdesc="Python library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('b7f3f2fd7e02cc9bdf92e7820faf5507dc95559b760ce5f224726cc0834087c4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
