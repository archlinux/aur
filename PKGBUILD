pkgname=craftbukkit-plugin-worldedit
pkgver=7.2.15
pkgrel=1
pkgdesc="easy-to-use in-game world editor for Minecraft, supporting both single player and multiplayer"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/worldedit"
license=("GPLv3")
source=("https://mediafilez.forgecdn.net/files/4586/220/worldedit-bukkit-${pkgver}.jar")
sha256sums=('06f38bf47e456b95e521984bceb365bb479499f28e40545d36323a5378e50ca3')

package() {
  install -Dm644 worldedit-bukkit-$pkgver.jar "$pkgdir/srv/craftbukkit/plugins/worldedit-bukkit.jar"
}
