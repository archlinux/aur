# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-alexsmobs
modname=alexsmobs
srvname=forge
pkgver=1.19.4
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/alexs-mobs'
arch=('any')
license=('GPL')
pkgdesc="Alex's Mobs is a Forge mod that adds 80 new mobs to Minecraft."

source=(https://mediafiles.forgecdn.net/files/3902/918/alexsmobs-1.19.4.jar)
depends=("forge-server>=41.1.0"
         "forge-server-hooks>=1.0.0"
         "forge-server-citadel>=1.12.7")
noextract=($modname-$pkgver.jar)
sha256sums=('da1d707c8a2dd005b88d5ac69a1895b95578a39526e2e5a4eae3c1fd48df1151')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
