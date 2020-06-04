# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-assertive
pkgname=python-$_pkgname

pkgver=1.2.1
pkgrel=1
pkgdesc="Flake8 unittest assert method checker"

url='https://github.com/jparise/flake8-assertive'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/jparise/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('908a1e3e4b2ef0cdfab1ebe04598b8802aa532247e8eabb7eed7ce775c4b790b4178533f86a17e49fbe0e53b090ac942ef4541130d09656f5ed1874106952e57')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

