# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=hacx-wad
pkgver=1.2
pkgrel=2
pkgdesc="Hacx IWAD (game data)"
arch=('any')
url="http://www.drnostromo.com/hacx/"
license=('custom')
makedepends=('unzip')
source=(http://www.drnostromo.com/hacx/files/hacx12.zip)
sha256sums=('70d25e8f4b48906759db32213927859a99b3b045d3291d468357b225d64cbf8b')

package() {
  install -Dm644 HACX.WAD "$pkgdir/usr/share/doom/hacx.wad"

  install -Dm644 HACX.TXT "$pkgdir/usr/share/licenses/$pkgname/hacx.txt"
}
