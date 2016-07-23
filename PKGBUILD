pkgname=craftbukkit-plugin-worldedit
pkgver=6.1.3
pkgrel=1
pkgdesc="easy-to-use in-game world editor for Minecraft, supporting both single player and multiplayer"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/worldedit"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
source=("http://dev.bukkit.org/media/files/922/48/worldedit-bukkit-6.1.3.jar")
md5sums=('83f44cad22972ea2d3335ab804e23e39')

package() {
  install -Dm644 worldedit-bukkit-$pkgver.jar "$pkgdir/srv/craftbukkit/plugins/worldedit-bukkit.jar"
}

# vim:set ts=2 sw=2 et:
