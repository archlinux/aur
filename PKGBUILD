pkgname=craftbukkit-plugin-terrain-control
epoch=1
pkgver=2.7.1
pkgrel=1
pkgdesc="TerrainControl is an advanced world generator. Through various configuration files it gives the user control over almost every aspect of Minecraft terrain generation"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/terrain-control"
license=("SpoutDev v1")
depends=("craftbukkit>=1.8")
source=("terraincontrol.jar::https://www.spigotmc.org/resources/terraincontrol.2214/download?version=27808")
noextract=("terraincontrol.jar")
md5sums=('35c5fecb1fd1497d845259c3a6af743e')

package() {
  install -Dm644 terraincontrol.jar "$pkgdir/srv/craftbukkit/plugins/terraincontrol.jar"
}

# vim:set ts=2 sw=2 et:
