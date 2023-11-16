# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=abbaye-des-morts
pkgver=2.0.2
pkgrel=1
pkgdesc="An obsolete videogame for a dark passage of history"
arch=('i686' 'x86_64')
url="https://github.com/nevat/abbayedesmorts-gpl"
license=('GPL3')
depends=('sdl2'  'sdl2_image' 'sdl2_mixer')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nevat/abbayedesmorts-gpl/archive/v$pkgver.tar.gz")
sha256sums=('3ea999aa3b01a8f2029dd87dd905726c507ccf23796938e84ad6973c21d52261')

build(){
  make -C abbayedesmorts-gpl-$pkgver
}

package() {
  make -C abbayedesmorts-gpl-$pkgver DESTDIR="$pkgdir/" install
}
