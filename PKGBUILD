pkgname=bitclk-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Binary release of bitclk - a terminal binary clock"
arch=('x86_64')
url="https://github.com/heyifan142857/bitclk"
license=('MIT')

provides=('bitclk')
conflicts=('bitclk')

options=('!debug')

source=("bitclk-linux-x86_64.tar.gz::https://github.com/heyifan142857/bitclk/releases/download/v$pkgver/bitclk-linux-x86_64.tar.gz")

sha256sums=('a276dcfda637722148ff569ea34e6252b388cf4b7f66ca488ed24c87e7c40625')

package() {
  install -Dm755 "$srcdir/bitclk" "$pkgdir/usr/bin/bitclk"
}
