# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=harmony-wad
pkgver=1.1
pkgrel=2
pkgdesc="Harmony IWAD (game data)"
arch=('any')
url="http://rabotik.nl/harmony.htm"
license=('custom')
source=(http://www.evil-soft.com/Heretic/harmonyv1.1.zip)
md5sums=('0f7ca801b131a8ddb52914e6ec5629b3')

package() {
  cd "harmony v1.1"

  install -Dm644 harm1.wad "$pkgdir"/usr/share/games/harmony/harm1.wad
  install -Dm644 Harmony.txt "$pkgdir"/usr/share/licenses/${pkgname}/Harmony.txt
  install -Dm644 other-files/sounds.txt "$pkgdir"/usr/share/licenses/${pkgname}/sounds.txt

  mkdir -p "$pkgdir"/usr/share/doom
  ln -s /usr/share/games/harmony/harm1.wad "$pkgdir"/usr/share/doom/harm1.wad
}
