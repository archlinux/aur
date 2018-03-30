# Maintainer: Alessio Marchetti <taeiolass at gmail dot com>
# Contributor: Alessio Marchetti <taeiolass at gmail dot com>


pkgname=tty-clock-tomato
pkgver=0.1
pkgrel=1
pkgdesc="Tomato timer for terminal based on tty-clock"
arch=('any')
url="https://github.com/Teiolass/tty-clock-tomato/tree/v0.1"
license=('BSD')
depends=('ncurses')
md5sums=('398cdf8f93faea2af5cdc8dae35a3d66')
source=($pkgname-$pkgver.tar.gz::https://github.com/Teiolass/tty-clock-tomato/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
