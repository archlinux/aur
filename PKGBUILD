pkgname=craftbukkit-plugin-worldguard
pkgver=7.0.4
pkgrel=1
pkgdesc="plugin providing all the little things (and some big ones), and it protects your servers from various problems."
arch=(any)
url="http://enginehub.org/worldguard"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
optdepends=(mariadb)
source=("https://dev.bukkit.org/projects/worldguard/files/3066271/download")
noextract=("worldguard-bukkit-$pkgver.jar")
md5sums=('392e060e34072f3d1c2cc12f619bb9ef')

package() {
  install -Dm644 worldguard-legacy-$pkgver-SNAPSHOT-dist.jar "$pkgdir/srv/craftbukkit/plugins/worldguard-bukkit-$pkgver.jar"
  chown craftbukkit:craftbukkit "$pkgdir/srv/craftbukkit/plugins/worldguard-bukkit-$pkgver.jar"
}
