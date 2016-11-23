# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.6c
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl' 'openal')
depends_x86_64=('lib32-sdl' 'lib32-openal')
# AUR helpers tend to use older, cached versions if the source name/url never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('a1ff8884a24413cc9b23ca347ded8c58abc713dc5a68618c9f48476694d7bc27')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
