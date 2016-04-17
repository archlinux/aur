# Maintainer: Jake <ja.ke@posteo.de>
pkgname=python2-awesome-slugify
_pkgname=awesome-slugify
pkgver=1.6.5
pkgrel=1
pkgdesc="Python flexible slugify function"
arch=(any)
url="https://github.com/dimka665/awesome-slugify"
license=('GPL3')
depends=('python2' 'python2-unidecode>=0.04.14' 'python2-regex')
makedepends=("python2-setuptools")
source=(http://pypi.python.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('58b9b751b4670e3c221f008dd61348a8')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}