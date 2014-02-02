# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=chexquest3-wad
pkgver=1.4
pkgrel=1
pkgdesc="Chex Quest 3 IWAD (game data)"
arch=('any')
url="http://www.chucktropolis.com/gamers.htm"
license=('custom')
source=(http://www.chucktropolis.com/downloads/ChexQuest3.zip)
md5sums=('e6e9bec61c1678ee0c883731dd43b60d')

package() {
  cd "$srcdir"

  install -Dm644 chex3.wad "$pkgdir/usr/share/doom/chex3.wad"

  install -Dm644 "CQ3 ReadMe.txt" "$pkgdir/usr/share/licenses/$pkgname/CQ3 ReadMe.txt"
}
