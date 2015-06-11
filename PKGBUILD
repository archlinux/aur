pkgname=craftbukkit-plugin-worldguard
pkgver=6.1
pkgrel=1
pkgdesc="plugin providing all the little things (and some big ones), and it protects your servers from various problems."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/worldguard"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
optdepends=(mariadb)
source=("http://dev.bukkit.org/media/files/881/691/worldguard-6.1.jar")
noextract=("worldguard-$pkgver.jar")
md5sums=('ebd40ac235e50274df60e1620b5e8735')

package() {
  install -Dm644 worldguard-${pkgver//_/-}.jar "$pkgdir/srv/craftbukkit/plugins/worldguard.jar"
}

# vim:set ts=2 sw=2 et:
