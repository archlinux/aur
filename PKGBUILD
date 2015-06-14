# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python2-configfile'
pkgver='1.1.1'
pkgrel=1
pkgdesc="Python2 library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python2')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('45492f357f242d4acfe9d1ce079f8e3e131b4269fe88f99e7e56d47959ae80df')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
