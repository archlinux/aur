# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.3.2
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=(i686 x86_64)
url='https://github.com/karlstav/cava'
license=(none)
depends=(glibc ncurses)
makedepends=(fftw)
source=(https://codeload.github.com/karlstav/cava/tar.gz/${pkgver})
sha1sums=('6c6d59ad900f9c5b3e071124b2f376b5d73926e9')

build() {
  cd $pkgname-$pkgver
  make VERSION="${pkgver}"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
}
