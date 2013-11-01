# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=hexen1-wad
pkgver=1.1
pkgrel=1
pkgdesc="The Hexen 1 Demo IWAD (game data)"
arch=('any')
url="http://hhexen.sourceforge.net/"
license=('unknown')
source=(http://downloads.sourceforge.net/hhexen/hexen_demo_wad_$pkgver.tgz)
md5sums=('59338254c9528d785a3bc4b47962eb78')

build() {
  install -Dm644 hexen.wad "$pkgdir"/usr/share/doom/hexen.wad
}

# vim:set ts=2 sw=2 et:
