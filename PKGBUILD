# Maintainer: Alexander Shibaev <sashashibaev@gmail.com>
pkgname=xarrow
pkgver=0.0.1
pkgrel=1
pkgdesc="An X11 arrow, watching your cursor."
arch=('any')
url="https://github.com/woowgers/xarrow"
license=('MIT')
depends=('base-devel' 'libx11')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/woowgers/xarrow/archive/v$pkgver.tar.gz")
sha256sums=('9c135e6d600d0f8aa8d2936afbffcebe05c254e366c71f526dba65d806eedb5e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 xarrow "$pkgdir/usr/bin/xarrow"
}
