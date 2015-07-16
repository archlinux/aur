# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.3.1
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=(i686 x86_64)
url='https://github.com/karlstav/cava'
license=(none)
depends=(glibc ncurses)
makedepends=(fftw)
source=(https://github.com/karlstav/cava/archive/${pkgver}.tar.gz)
sha1sums=('48c13d8871ce55d27d6edc832c1fc16f8bd9db0c')

build() {
  cd $pkgname-$pkgver
  make VERSION="${pkgver}"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
}
