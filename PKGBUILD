# Maintainer: zlsun <zlsun1995 at gmail dot com>

pkgname=yah3c
pkgver=0.6
pkgrel=1
pkgdesc="A program for h3c authentication in SYSU east campus."
arch=('any')
url="https://github.com/zlsun/yah3c"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/zlsun/yah3c/archive/v$pkgver.tar.gz")
md5sums=("e5f195a5338b1b269e7e06ccfd8a32f0")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
