# Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.2.0
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=(i686 x86_64)
url='https://github.com/karlstav/cava'
license=(none)
depends=(glibc)
makedepends=(fftw)
source=(https://github.com/karlstav/cava/archive/${pkgver}.tar.gz)
sha1sums=('f7def5df6541042bbbaacf324114753151655095')

build() {
  cd $pkgname-$pkgver
  make VERSION="${pkgver}"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
}
