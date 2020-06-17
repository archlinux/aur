# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=craftbukkit-plugin-terrain-control
epoch=1
pkgver=2.8.1
pkgrel=1
pkgdesc="Minecraft Terrain Generator for SpigotMC and Forge"
arch=('any')
url="https://www.spigotmc.org/resources/terraincontrol.2214/"
license=("MIT")
depends=("craftbukkit>=1.9.2")
source=("TerrainControl.jar::https://github.com/MCTCP/TerrainControl/releases/download/v2.8.1/TerrainControl-Spigot.jar"
	"https://raw.githubusercontent.com/MCTCP/TerrainControl/v2.8.1/LICENCE.txt")
noextract=("TerrainControl.jar")
sha512sums=('7367e3d788f67afd91eaf908913c4e1c212356a08216c0fa1033642c631bf5790c783ba7e83e1149545b48d74cb483f81bf67e7e12fc67479b8cddc16e434755'
            '21a308d4789d42964b4ea34812fee7c3d767c8f5fb5696f76f482ebb78a16205875a11aaa9071e8c2fc43c3869109164603e69d91a0da19d6049cfea8984214d')

package() {
  install -Dm644 $srcdir/TerrainControl.jar "$pkgdir/srv/craftbukkit/plugins/TerrainControl.jar"
  install -Dm644 $srcdir/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
