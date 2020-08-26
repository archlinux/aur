# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=darglint
pkgname=python-$_pkgname

pkgver=1.5.3
pkgrel=1
pkgdesc="A python documentation linter which checks that the docstring description matches the definition."

url='https://github.com/terrencepreilly/darglint'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/terrencepreilly/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9e5463a39eff53ce55b1def3b09c7d703dfed80eb7990bc48be109b074d7ccf2ecef5cdc54b1aa09ff9a6cf0e802a851579fc612f3b230e9a3c556e8e4434f0d')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

