# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lzdoom-bin')
pkgver='3.84'
pkgrel=1
pkgdesc="Fork of GZDoom 3.3.2 for legacy systems"
arch=('i686' 'x86_64')
url="https://www.zdoom.org/downloads"
license=('GPL3')
depends=('sdl2' 'zlib')
optdepends=('fluidsynth' 'libsndfile' 'mpg123' 'openal' 'timidity++')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/drfrag666/gzdoom/releases/download/$pkgver/lzdoom_${pkgver}_i386.deb")
source_x86_64=("https://github.com/drfrag666/gzdoom/releases/download/$pkgver/lzdoom_${pkgver}_amd64.deb")
sha512sums_i686=('95d9927506b38c940749a14e1dab83afc68c4497be34bffcb1c390649648f6e10d1bf7e7472b03f18e73970528bf72bcfef3a412fa8b8b9b1f9e5b646ce276a8')
sha512sums_x86_64=('89aa38d04e9bf029c191b5f7300875330c642a448e7dc978495262934c36b00c6c7709fa5f77ac21897b72a9bdf9d5373f6051f1e81f1586afc7758139cfc4e8')

package() {
	tar xf data.tar.xz -C "$pkgdir"
	cd "$pkgdir"
	mkdir usr/bin
	mv usr/games/* usr/bin
	rm -rf usr/games
}
# vim:set ts=2 sw=2 et:
