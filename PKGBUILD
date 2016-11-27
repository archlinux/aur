# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=python2-validictory
_pkgname=validictory
pkgver=1.1.0
pkgrel=1
pkgdesc="General purpose python data validator"
arch=('any')
url="https://github.com/jamesturk/validictory"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/jamesturk/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('1662ca12b0fa906d2bdd501dfafaa2fc')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
