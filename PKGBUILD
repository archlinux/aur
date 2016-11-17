# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.6b
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl' 'openal')
depends_x86_64=('lib32-sdl' 'lib32-openal')
# AUR helpers tend to use older, cached versions if the source name/url never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('ad313adee8893c1c5b9590d71993ce95a5807217c8b5bf0bfcf59134779ae2a7')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
