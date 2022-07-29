# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-citadel
modname=citadel
srvname=forge
pkgver=1.12.7
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/citadel'
arch=('any')
license=('unlicensed')
pkgdesc="Citadel is a Library mod required for advanced animations and entity properties in 1.14 and beyond."

source=(https://mediafiles.forgecdn.net/files/3902/867/citadel-1.12.7-1.19.jar)
depends=("forge-server>=41.0.96"
         "forge-server-hooks>=1.0.0")
noextract=($modname-$pkgver-$minver.jar)
sha256sums=('67194c3778c0359f9392a26b7edcced24fdb44c250920c62e94d2a4898e9a83a')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
