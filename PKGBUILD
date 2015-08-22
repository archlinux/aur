# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python2-configfile'
pkgver='1.2.2'
pkgrel=1
pkgdesc="Python2 library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python2')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('8bfd37f7e07cebd8305f2219b7a27cdcf45a94eb51de7b28cef1f4682f66d9b5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
