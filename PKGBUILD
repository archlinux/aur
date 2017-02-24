# Maintainer: Nahuel Alonso <blizzard.nna@gmail.com>
pkgname=webmc
pkgver="0.3"
pkgrel=1
pkgdesc="ffmpeg Qt5 client for quick webms convertions"
arch=(x86_64)
url="https://github.com/nahwar/webmc"
license=('GPL')
depends=(ffmpeg qt5-base xterm)
makedepends=(cmake git qt5-base)
source=(git+"https://github.com/nahwar/webmc.git")
md5sums=('SKIP')

build() {
  cd $srcdir/webmc/webmc
  cmake .
  make
}
package() {
	install -Dm755 "$srcdir/webmc/webmc/webmc" "$pkgdir/usr/bin/webmc"
}
