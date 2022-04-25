# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-annotations-complexity
pkgname=python-$_pkgname

pkgver=0.0.7
pkgrel=1
pkgdesc="flake8 plugin to validate annotations complexity"

url='https://github.com/best-doctor/flake8-annotations-complexity'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/best-doctor/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('180f18f60188c0fae32cd4e996141b8ad68f3773abf923efde40a78203af839f9ae29bc6f10f9c22c95ce4a2ebb4d8cf33f5c27879ccde084c6a04593863818c')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

