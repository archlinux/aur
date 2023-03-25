# Maintainer: Alexander Shibaev <sashashibaev@gmail.com>
pkgname=xarrow
pkgver=0.0.2
pkgrel=1
pkgdesc="An X11 arrow, watching your cursor."
arch=('any')
url="https://github.com/woowgers/xarrow"
license=('MIT')
depends=('base-devel' 'libx11')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/woowgers/xarrow/archive/v$pkgver.tar.gz")
sha256sums=('0ef2f2ab7598987335a86b44dfee36d57ceed76935656975b52de42a5203e995')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 xarrow "$pkgdir/usr/bin/xarrow"
}
