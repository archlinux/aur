# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=eradicate
pkgname=python-$_pkgname

pkgver=2.0.0
pkgrel=1
pkgdesc="Removes commented-out code from Python files"

url='https://github.com/myint/eradicate'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/myint/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('947a3890ccb1dbb52e73b37e632ae5ba1eff732d9d0b0dc127fa8dc908412e864fcda3203274d5eb1645b22f6e97a90ebb13cd4363a2360d6591475d909bdb96')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
