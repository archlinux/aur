pkgname=craftbukkit-plugin-worldguard
pkgver=6.2.1
pkgrel=1
pkgdesc="plugin providing all the little things (and some big ones), and it protects your servers from various problems."
arch=(any)
url="http://enginehub.org/worldguard"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
optdepends=(mariadb)
source=("http://builds.enginehub.org/job/worldguard/9687/download/worldguard-legacy-$pkgver-SNAPSHOT-dist.jar")
noextract=("worldguard-legacy-$pkgver-SNAPSHOT-dist.jar")
md5sums=('c30e606fbb70f2ed16555d8dbdce7ad0')

package() {
  install -Dm644 worldguard-legacy-$pkgver-SNAPSHOT-dist.jar "$pkgdir/srv/craftbukkit/plugins/worldguard-legacy-$pkgver-SNAPSHOT-dist.jar"
  chown craftbukkit:craftbukkit "$pkgdir/srv/craftbukkit/plugins/worldguard-legacy-$pkgver-SNAPSHOT-dist.jar"
}
