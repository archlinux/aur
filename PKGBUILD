# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-alexsmobs
modname=alexsmobs
srvname=forge
pkgver=1.19.3
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/alexs-mobs'
arch=('any')
license=('GPL')
pkgdesc="Alex's Mobs is a Forge mod that adds 80 new mobs to Minecraft."

source=(https://mediafiles.forgecdn.net/files/3872/430/alexsmobs-1.19.3.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.96"
         "forge-server-citadel>=1.12.6")
noextract=($modname-$pkgver.jar)
sha256sums=('52d3ac9583d7575ae10f6d085838d942f735ffe18fa0315aebb5be60140ebf15')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
