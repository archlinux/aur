# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-annotations-complexity
pkgname=python-$_pkgname

pkgver=0.0.4
pkgrel=1
pkgdesc="flake8 plugin to validate annotations complexity"

url='https://github.com/best-doctor/flake8-annotations-complexity'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/best-doctor/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('47f3b86e713f6d9e07a93fcb4faac2b371d6b1bf65a709468d3c7e96e764a893b22c7a5321736f40ff827c94bb964677f662de873abb8ac63c1e2361206ef87c')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

