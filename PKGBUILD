# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-slugify
pkgver=1.1.2
pkgrel=1
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/un33k/python-slugify"
license=('BSD')
depends=("python" "python-unidecode>=0.04.16")
makedepends=("python-setuptools")
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('7620eea3d354f1741277ab8e6e642da7')
sha256sums=('fbdb40424348e118e68d27e2e030c05d353008ab361db394a3d590cdecff26b0')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
