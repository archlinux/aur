# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.5f
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl_mixer' 'openal')
depends_x86_64=('lib32-sdl_mixer' 'lib32-openal')
source=("http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('3422138ba2ef8616fb8e9f89f35362de400c1168d3b876b673d735d889b6c860')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
