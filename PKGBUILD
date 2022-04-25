# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-variables-names
pkgname=python-$_pkgname

pkgver=0.0.5
pkgrel=1
pkgdesc="A flake8 extension that helps to make more readable variables names"

url='https://github.com/best-doctor/flake8-variables-names'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/best-doctor/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3f0f87d36af4aa9782b4738637e8f1d4b1ca678e5387b0768d21c1aab078e0e1e48b635626bbae7399e2e97f0a1cd545f5c45db72f54af3c03b5a6eee872e36b')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

