# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=darglint
pkgname=python-$_pkgname

pkgver=1.5.5
pkgrel=1
pkgdesc="A python documentation linter which checks that the docstring description matches the definition."

url='https://github.com/terrencepreilly/darglint'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/terrencepreilly/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('7f93da8922049fd1666e8873e7c01434dfaee8f999603fe212a2c3f86064e7d75a840c347dfb3b7c378c5a1b6f7df91a7975694d3f1e351965da44452dc57aae')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

