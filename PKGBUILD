# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=urbanbrawl-wad
pkgver=1.0
pkgrel=1
pkgdesc="Urban Brawl: Action Doom 2 IWAD (game data)"
arch=('any')
url="http://action.mancubus.net/"
license=('custom')
source=(ftp://ftp.fu-berlin.de/pc/msdos/games/idgames/levels/doom2/Ports/a-c/action2.zip)
sha256sums=('cb5f127bfdb6f43d5acbbb197a4d45daa80dc6b2edfc464235f3cdcbb00db484')

package() {
  install -Dm644 action2.wad "$pkgdir/usr/share/games/urbanbrawl/action2.wad"

  mkdir -p "$pkgdir/usr/share/doom"
  ln -s /usr/share/games/urbanbrawl/action2.wad "$pkgdir/usr/share/doom/action2.wad"

  install -Dm644 action2.txt "$pkgdir/usr/share/licenses/$pkgname/action2.txt"
}
