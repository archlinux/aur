# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.5j
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends_i686=('sdl' 'openal')
depends_x86_64=('lib32-sdl' 'lib32-openal')
source=("http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('3b27a242218da7cc967b4f1d53f4ab1360bf5cd74a4ffe5d5cfad4f9e795a757')
license=('custom')

package() {
  install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
}
