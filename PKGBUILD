pkgname=craftbukkit-plugin-worldguard
pkgver=6.1.7
pkgrel=1
pkgdesc="plugin providing all the little things (and some big ones), and it protects your servers from various problems."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/worldguard"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
optdepends=(mariadb)
source=("http://builds.enginehub.org/job/worldedit/9766/download/worldedit-bukkit-$pkgver-SNAPSHOT-dist.jar")
noextract=("worldedit-bukkit-$pkgver-SNAPSHOT-dist.jar")
md5sums=('2611bcfb780ec31909f59990a93364d9')

package() {
  install -Dm644 worldedit-bukkit-$pkgver-SNAPSHOT-dist.jar "$pkgdir/srv/craftbukkit/plugins/worldedit-bukkit-$pkgver-SNAPSHOT-dist.jar"
}
