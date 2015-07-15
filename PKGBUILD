# Maintainer:  Ainola
# Contributor: Hugo Lobo <hugo_alobo@hotmailcom>

pkgname=binkplayer
pkgver=2.5e
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl_mixer' 'openal')
depends_x86_64=('lib32-sdl_mixer' 'lib32-openal')
source=("http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('127fa1bb9079461b5f8d7016cd519ef8ff7ae2c6995099de2b8f304176cc9263')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
