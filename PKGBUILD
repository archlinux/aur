# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python2-configfile'
pkgver='1.2.1'
pkgrel=1
pkgdesc="Python2 library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python2')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('7b2ee36661445534e729ec28d499365659b9a357f5891ea966996391f87c8ca7')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
