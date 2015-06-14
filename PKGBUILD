# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python-configfile'
pkgver='1.1.1'
pkgrel=1
pkgdesc="Python library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('b6178fc4377f1025f4b2526eeea02db93bb5560ee1ab27552c39348d03c6e99d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
