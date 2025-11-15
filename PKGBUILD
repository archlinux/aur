# Maintainer: Ender Shiru <endershiru@outlook.com>
# Contributer: Jan Cholasta <grubber at grubber cz>

pkgname=chexquest3-wad
pkgver=1.4
pkgrel=2
pkgdesc="Chex Quest 3 IWAD (game data)"
arch=('any')
url="https://web.archive.org/web/20140326194047/http://www.chucktropolis.com/gamers.htm"
license=('custom')
source=(https://archive.org/download/ChexQuest3_1020/ChexQuest3.zip)
sha256sums=('29abab521cf9de4cc561afb84cf804793d90f1cf40f6384e19b34f72923dd446')

package() {
  install -Dm644 chex3.wad "$pkgdir/usr/share/games/doom/chex3.wad"

  install -Dm644 "CQ3 ReadMe.txt" "$pkgdir/usr/share/licenses/$pkgname/CQ3 ReadMe.txt"
}
