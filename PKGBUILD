# Maintainer: zlsun <zlsun1995 at gmail dot com>

pkgname=yah3c
pkgver=0.6.1
pkgrel=2
pkgdesc="A program for h3c authentication in SYSU east campus."
arch=('any')
url="https://github.com/zlsun/yah3c"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/zlsun/yah3c/archive/v$pkgver.tar.gz")
md5sums=("f3a7be590d778ed068d71e13c1b7c597")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
