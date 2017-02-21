# Maintainer: zlsun <zlsun1995 at gmail dot com>

pkgname=yah3c
pkgver=0.6.2
pkgrel=2
pkgdesc="A program for h3c authentication in SYSU east campus."
arch=('any')
url="https://github.com/zlsun/yah3c"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/zlsun/yah3c/archive/v$pkgver.tar.gz")
md5sums=("dd6f034032febc6db8db812ce3d2647d")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
