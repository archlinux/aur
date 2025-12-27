# Maintainer: Your Name <your.email@example.com>
pkgname=audiovis
pkgver=1.0.0
pkgrel=1
pkgdesc="A customizable terminal audio visualizer using PipeWire and ncurses"
arch=('x86_64')
url="https://github.com/YOURUSERNAME/audiovis"
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
