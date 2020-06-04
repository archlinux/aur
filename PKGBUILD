# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-variables-names
pkgname=python-$_pkgname

pkgver=0.0.2
pkgrel=1
pkgdesc="A flake8 extension that helps to make more readable variables names"

url='https://github.com/best-doctor/flake8-variables-names'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/best-doctor/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c59938076df1b8d4686511b76e402f7d13531cbb1ecb47d856535210e1b2d04ff6549ec4621d09927ca0f4a358bea381a6303714fa298f808811f70ccb1734ee')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

