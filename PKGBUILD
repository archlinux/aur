pkgname=craftbukkit-plugin-lockette
pkgver=1.8.33
pkgrel=1
pkgdesc="The sign-based container and door lock for Bukkit!"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/lockette/"
license=("NPOSL")
makedepends=(dos2unix)
depends=("craftbukkit")
source=("http://dev.bukkit.org/media/files/920/598/Lockette.jar")
sha256sums=('18af84556dcba961b4cee1099793cb5ffa450e618799c96e64313fd9ba2a465e')

package() {
  install -Dm644 Lockette.jar "$pkgdir/srv/craftbukkit/plugins/Lockette.jar"
}

