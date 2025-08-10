# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=strife0-wad
pkgver=1.1
pkgrel=1
pkgdesc="The Strife shareware IWAD (game data)"
arch=('any')
url="https://www.mobygames.com/game/960/strife"
license=('unknown')
source=(https://ftp.fu-berlin.de/pc/msdos/games/idgames/roguestuff/strife11.zip)
sha256sums=('ab63419992dfc82e40cee8aad3a83944425ada2259f8cf3cc0e5a0d57199bc47')

package() {
  install -Dm644 STRIFE0.WAD "$pkgdir/usr/share/doom/strife0.wad"
}
