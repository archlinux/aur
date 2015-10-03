# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python-configfile'
pkgver='1.2.2'
pkgrel=2
pkgdesc="Python library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('213daeba91a026185e47b7f3fe2827b1c162cf9fa619744b98ef197de9e0ef96')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
