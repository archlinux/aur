pkgname=craftbukkit-plugin-terrain-control
epoch=1
pkgver=2.8.0
pkgrel=1
pkgdesc="TerrainControl is an advanced world generator. Through various configuration files it gives the user control over almost every aspect of Minecraft terrain generation"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/terrain-control"
license=("SpoutDev v1")
depends=("craftbukkit>=1.9.2")
source=("TerrainControl.jar::https://www.spigotmc.org/resources/terraincontrol.2214/download?version=83525")
noextract=("TerrainControl.jar")
md5sums=('dfd4267605fa430f38770a663630e24b')

package() {
  install -Dm644 TerrainControl.jar "$pkgdir/srv/craftbukkit/plugins/TerrainControl.jar"
}

# vim:set ts=2 sw=2 et:
