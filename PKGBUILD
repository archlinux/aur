# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python2-configfile'
pkgver='1.2.0'
pkgrel=1
pkgdesc="Python2 library for dynamically parsing and editing configuration files with support for subsections."
arch=('any')
url="https://kynikos.github.io/lib.py.configfile"
license=('GPL3')
depends=('python2')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.configfile/$pkgname-$pkgver.tar.bz2")
sha256sums=('2d635eeedddde62f5bf3a924a85ff228708cc1c0e2b379c4a06574615efcbfb5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
