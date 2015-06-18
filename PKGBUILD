# Maintainer:  Ainola
# Contributor: Hugo Lobo <hugo_alobo@hotmailcom>

pkgname=binkplayer
pkgver=2.5d
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl_mixer' 'openal')
depends_x86_64=('lib32-sdl_mixer' 'lib32-openal')
source=("http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('e08ba2b728d6251b187e28750fcacfb02f56410bc6063813ed6efa893a1312fe')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
