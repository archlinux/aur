pkgname=craftbukkit-plugin-terrain-control
epoch=1
pkgver=2.7.2
pkgrel=1
pkgdesc="TerrainControl is an advanced world generator. Through various configuration files it gives the user control over almost every aspect of Minecraft terrain generation"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/terrain-control"
license=("SpoutDev v1")
depends=("craftbukkit>=1.8")
source=("TerrainControl.jar::https://www.spigotmc.org/resources/terraincontrol.2214/download?version=41506")
noextract=("TerrainControl.jar")
md5sums=('cbe2459a4374a5a8282389bb9698eec0')

package() {
  install -Dm644 TerrainControl.jar "$pkgdir/srv/craftbukkit/plugins/TerrainControl.jar"
}

# vim:set ts=2 sw=2 et:
