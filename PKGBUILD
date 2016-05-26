# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
_pkgname=param
pkgname=python2-$_pkgname
pkgver=1.3.2
pkgrel=1
pkgdesc="Declarative Python programming using Parameters"
arch=("any")
url="https://ioam.github.io/param/"
license=('BSD')
depends=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('1449b18faad508bdbc0cce7ae81b493b')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
