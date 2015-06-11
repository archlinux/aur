pkgname=craftbukkit-plugin-terrain-control
pkgver=2.7.2
pkgrel=1
pkgdesc="TerrainControl is an advanced world generator. Through various configuration files it gives the user control over almost every aspect of Minecraft terrain generation"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/terrain-control"
license=("SpoutDev v1")
depends=("craftbukkit>=1.8")
source=("http://build.mctcp.com/job/TerrainControl%20-%20Master%20-%20Gradle/default/lastSuccessfulBuild/artifact/platforms/bukkit/build/distributions/terraincontrol-bukkit-$pkgver-SNAPSHOT.jar")
noextract=("terraincontrol-bukkit-$pkgver-SNAPSHOT.jar")
md5sums=('SKIP')

package() {
  install -Dm644 terraincontrol-bukkit-$pkgver-SNAPSHOT.jar "$pkgdir/srv/craftbukkit/plugins/terraincontrol-bukkit.jar"
}

# vim:set ts=2 sw=2 et:
