# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lzdoom-bin
pkgver=3.87b
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
sha256sums_i686=('8406f70e47eeff5bf91b969f5dfc41cda1c95018b8baf79a6769b69fbf346073')
sha256sums_x86_64=('a3690ada52ec3c0774ed626427fe61312989b12375b83d89923869bceeb1116f')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  cd "${pkgdir}"
  mkdir usr/bin
  mv usr/games/* usr/bin
  rm -rf usr/games
}
# vim:set ts=2 sw=2 et:
