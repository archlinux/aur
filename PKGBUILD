# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-commas
pkgname=python-$_pkgname

pkgver=2.0.0
pkgrel=1
pkgdesc="Flake8 extension for enforcing trailing commas in python"

url='https://github.com/PyCQA/flake8-commas'
arch=('any')
license=('MIT')

provides=('duniterpy')
depends=('python')

source=("https://github.com/PyCQA/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('92c352aa6e85b18b6f4fa53c92291e206d94fb83ea6284e48a663fd1969bb45a0b72b2a5d3bd5d36bd296055dfd4fdd1875f4eddf9534c785f07dccc763f0f21')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

