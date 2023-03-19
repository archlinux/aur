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
sha256sums=('dd10aec1362127478b99cbcf14f4f96465e13bf812442b0f25fd3d36541850b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 xarrow "$pkgdir/usr/bin/xarrow"
}
