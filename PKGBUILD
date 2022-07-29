# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-goblintraders
modname=goblintraders
srvname=forge
pkgver=1.7.3
minver=1.19
pkgrel=2

url='https://www.curseforge.com/minecraft/mc-mods/goblin-traders'
arch=('any')
license=('GPL')
pkgdesc="Goblin Traders is a simple mod that adds goblins which have unique trades."

source=(https://mediafiles.forgecdn.net/files/3874/104/goblintraders-1.7.3-1.19.jar)
depends=("forge-server>=41.1.0"
         "forge-server-hooks>=1.0.0")
noextract=($modname-$pkgver-$minver.jar)
sha256sums=('c4b481ca2b058b0d52a87d13fdf622847acba82d1ce3efde2c213095cd716ae5')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
