# Maintainer: Hyuuwu <hyuaee@yahoo.com>
pkgname=audiovis
pkgver=1.0.0
pkgrel=1
pkgdesc="A customisable audio visualizer made in C"
arch=('x86_64')
url="https://github.com/hyuuwu/audiovis"
license=('GPL3')
depends=('pipewire' 'fftw' 'ncurses')
makedepends=('pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 audiovis "$pkgdir/usr/bin/audiovis"
}
