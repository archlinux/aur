# Contributor: Jan Cholasta <grubber@grubber.cz>

pkgname=harmony-wad
pkgver=1.1
pkgrel=1
pkgdesc="Harmony IWAD (game data)"
arch=('any')
url="http://rabotik.nl/harmony.htm"
license=('custom')
source=(http://files.drdteam.org/index.php/files/download/12950/harmony.zip)
md5sums=('51b4b38e16622946edfd01d74d246120')

build() {
  cd "$srcdir"

  install -Dm644 harm1.wad "$pkgdir"/usr/share/games/harmony/harm1.wad
  install -Dm644 Harmony.txt "$pkgdir"/usr/share/licenses/${pkgname}/Harmony.txt
  install -Dm644 other-files/sounds.txt "$pkgdir"/usr/share/licenses/${pkgname}/sounds.txt

  mkdir -p "$pkgdir"/usr/share/doom
  ln -s /usr/share/games/harmony/harm1.wad "$pkgdir"/usr/share/doom/harm1.wad
}
