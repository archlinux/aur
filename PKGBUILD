# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=hexen1-wad
pkgver=1.1
pkgrel=1
pkgdesc="The Hexen 1 Demo IWAD (game data)"
arch=('any')
url="http://hhexen.sourceforge.net/"
license=('unknown')
source=(https://downloads.sourceforge.net/hhexen/hexen_demo_wad_$pkgver.tgz)
sha256sums=('08e9b57ce9111be04f8b7fa7fc98bd8ecb2af58914497d9a726f610377c406fc')

package() {
  install -Dm644 hexen.wad "$pkgdir/usr/share/doom/hexen.wad"
}
