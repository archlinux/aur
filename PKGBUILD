# Maintainer:  Ainola
# Contributor: Hugo Lobo <hugo_alobo@hotmailcom>

pkgname=binkplayer
pkgver=2.5c
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl_mixer' 'openal')
depends_x86_64=('lib32-sdl_mixer' 'lib32-openal')
source=("http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('ac5d22e083ea873a18dde1629f3e4fa515e7bc044e91a5f53f9cdee6c692cc8a')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
