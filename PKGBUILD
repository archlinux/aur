# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-slugify
pkgver=1.1.4
pkgrel=2
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/un33k/python-slugify"
license=('BSD')
depends=("python" "python-unidecode>=0.04.16")
makedepends=("python-setuptools")
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8ea8d2cd3433aef40dab408bf0b49a76')
sha256sums=('e674f0d45eaeb5c47b7d4771319889a39b15ee87aa62c3b2fcc33cf34e94fc98')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
