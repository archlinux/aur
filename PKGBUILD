# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=craftbukkit-plugin-luckyblocks
pkgver=5.1
pkgrel=1
pkgdesc="Create LuckyBlocks! You can get the block in the creative inventory or by the custom crafting recipe!"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/luckyblocks"
license=("All Rights Reserved")
_jarfile=Luckyblocks_V${pkgver}.jar
source=("http://dev.bukkit.org/media/files/807/933/$_jarfile")
noextract=("$_jarfile")
depends=("craftbukkit")
sha256sums=(85120405fb0301d904d92d0b3c7daf874551d7862c9e1d647830f723dad3c27d)

package() {
	install -Dm644 -g craftbukkit -o craftbukkit "$srcdir/$_jarfile" "$pkgdir/srv/craftbukkit/plugins/$_jarfile"
}

# vim:set ts=2 sw=2 et:
