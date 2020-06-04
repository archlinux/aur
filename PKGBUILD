# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=darglint
pkgname=python-$_pkgname

pkgver=1.4.0
pkgrel=1
pkgdesc="A python documentation linter which checks that the docstring description matches the definition."

url='https://github.com/terrencepreilly/darglint'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/terrencepreilly/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b287805e6296320de4d77f026a7011bf33a4d1da9162f0ffbdc150d9f526e4526228c640455c465706c0aa43b4d64db76bb3916add36d82e226d2df9b054496e')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

