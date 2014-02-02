# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=strife0-wad
pkgver=1.1
pkgrel=1
pkgdesc="The Strife shareware IWAD (game data)"
arch=('any')
url="http://www.mobygames.com/game/dos/strife"
license=('unknown')
source=(ftp://ftp.fu-berlin.de/pc/msdos/games/idgames/roguestuff/strife11.zip)
md5sums=('972070afb30c96fc3c69d954dfab2424')

package() {
  cd "$srcdir"

  install -Dm644 STRIFE0.WAD "$pkgdir/usr/share/doom/strife0.wad"
}
