# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-slugify
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/un33k/python-slugify"
license=('BSD')
depends=("python" "python-unidecode>=0.04.16")
makedepends=("python-setuptools")
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bba3b03b746a37625a36bd4987df6009')
sha256sums=('fc0613723a51ae2b6bf69bcf3d214555b1855314a5ef3c79f959c8663695fb56')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
