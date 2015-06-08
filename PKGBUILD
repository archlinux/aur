# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=sdl_stretch
pkgver=0.3.1
pkgrel=1
pkgdesc="Stretch functions for SDL"
arch=('i686' 'x86_64')
url="http://sdl-stretch.sourceforge.net/"
license=("GPL")
depends=('sdl')
source=("http://downloads.sourceforge.net/project/sdl-stretch/sdl-stretch/0.3.1/SDL_stretch-${pkgver}.tar.bz2")
sha256sums=('7cbf0bfab00c3edd6e71e187d2a2c48277048780e2c92408baab7b623532fcd7')

build() {
  cd ${srcdir}/SDL_stretch-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/SDL_stretch-${pkgver}

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
