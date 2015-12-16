# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.5m
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl' 'openal')
depends_x86_64=('lib32-sdl' 'lib32-openal')
source=("http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('f6366886e5ff5069c7370e863b83f02719e4a05c3dd2adfd4ae8d7aa17c9b01f')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
