# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lzdoom-bin
pkgver=3.87
pkgrel=1
pkgdesc='Fork of GZDoom 3.3.2 for legacy systems'
arch=('i686' 'x86_64')
url='https://www.zdoom.org/downloads'
license=('GPL3')
depends=('sdl2' 'alsa-lib')
optdepends=('fluidsynth' 'libsndfile' 'mpg123' 'openal' 'timidity++')
options=('!strip' '!emptydirs')
source_i686=("${pkgname}-${pkgver}_i686.deb::https://github.com/drfrag666/gzdoom/releases/download/${pkgver}/lzdoom_${pkgver}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_x86_64.deb::https://github.com/drfrag666/gzdoom/releases/download/${pkgver}/lzdoom_${pkgver}_amd64.deb")
sha256sums_i686=('4f62061a4afa54c649f12909d3242dd5c823e2707303c28a577bc7650cfa80c7')
sha256sums_x86_64=('2a179d1b4062606591d5cfa5c6e5c81f0f8f695775930c03fc7dbc3267ce1fe7')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
  mkdir usr/bin
  mv usr/games/* usr/bin
  rm -rf usr/games
}
# vim:set ts=2 sw=2 et:
