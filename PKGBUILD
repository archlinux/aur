# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=craftbukkit-plugin-luckyblocks
pkgver=10.0
pkgrel=1
pkgdesc="Create LuckyBlocks! You can get the block in the creative inventory or by the custom crafting recipe!"
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/luckyblocks"
license=("All Rights Reserved")
_jarfile=LuckyBlocks_${pkgver}.jar
source=("http://dev.bukkit.org/media/files/891/310/$_jarfile")
noextract=("$_jarfile")
depends=("craftbukkit")
sha256sums=('6f27a3638a40533f42f997e636ea123b89b5a1776f555c11affb787add80ec56')

package() {
	install -Dm644 -g craftbukkit -o craftbukkit "$srcdir/$_jarfile" "$pkgdir/srv/craftbukkit/plugins/$_jarfile"
}

# vim:set ts=2 sw=2 et:
