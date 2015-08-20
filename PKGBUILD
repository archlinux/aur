# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python-configfile'
pkgver='1.2.1'
pkgrel=1
pkgdesc="Python library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('a9d1d6fe4a59a2b45e020b61c86f6119650dd715733e890df63a18694414c726')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
