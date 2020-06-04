# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=eradicate
pkgname=python-$_pkgname

pkgver=1.0
pkgrel=1
pkgdesc="Removes commented-out code from Python files"

url='https://github.com/myint/eradicate'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/myint/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('720662c25a571791d9ffe15aaaff7b67f5c73945a855defb7b0dec9379031eb9f1d5e5b9b132ba520a0ff14e5af1eb2e110aeb2621a0df75b5cc16c93307ab6a')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
