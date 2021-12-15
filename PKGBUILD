# Maintainer: Jonni Westphalen <jonny.westphalen@googlemail.com>
pkgname=python-pyclibrary
pkgver=0.1.7
pkgrel=1
pkgdesc="C parser and bindings automation for Python"
arch=('any')
url="https://github.com/MatthieuDartiailh/pyclibrary"
license=('MIT')
depends=('python' 'python-pyparsing')
source=("pyclibrary_sources::git+https://github.com/MatthieuDartiailh/pyclibrary.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/pyclibrary_sources"
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
}
