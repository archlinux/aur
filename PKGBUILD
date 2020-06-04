# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-print
pkgname=python-$_pkgname

pkgver=3.1.0
pkgrel=1
pkgdesc="Check for Print statements in python files."

url='https://github.com/jbkahn/flake8-print'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/JBKahn/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('7a83fbe95e0b69fc3490b7402d1172f916872e0b1fa073e42277c8413fec31486bc3d08483e5f9a2e70a565ad371aac72400323353d25c18d8561e204ae8bece')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

