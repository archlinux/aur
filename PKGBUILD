# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=hacx-wad
pkgver=1.2
pkgrel=1
pkgdesc="Hacx IWAD (game data)"
arch=('any')
url="http://www.drnostromo.com/hacx/"
license=('custom')
source=(http://www.drnostromo.com/hacx/files/hacx12.zip)
md5sums=('38cdd2baa912e771da562b44448206ec')

package() {
  cd "$srcdir"

  install -Dm644 HACX.WAD "$pkgdir/usr/share/doom/hacx.wad"

  install -Dm644 HACX.TXT "$pkgdir/usr/share/licenses/$pkgname/hacx.txt"
}
