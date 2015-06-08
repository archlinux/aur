pkgname=craftbukkit-plugin-worldedit
pkgver=6.1
pkgrel=1
pkgdesc="easy-to-use in-game world editor for Minecraft, supporting both single player and multiplayer"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/worldedit"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
source=("http://dev.bukkit.org/media/files/880/435/worldedit-bukkit-6.1.jar")
md5sums=('13749e1701499d379765bb218191035a')

package() {
  install -Dm644 worldedit-bukkit-$pkgver.jar "$pkgdir/srv/craftbukkit/plugins/worldedit-bukkit.jar"
}

# vim:set ts=2 sw=2 et:
