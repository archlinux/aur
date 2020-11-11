# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-print
pkgname=python-$_pkgname

pkgver=3.1.4
pkgrel=1
pkgdesc="Check for Print statements in python files."

url='https://github.com/jbkahn/flake8-print'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/JBKahn/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('f5caf02478c1bd47df7f922b560de97be5dc103e61461dea5e84b20111761f259dd231fb8c53f45f921ac5b0b010daf0cd5cca6024eae8e33f434d301eaba6bb')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

