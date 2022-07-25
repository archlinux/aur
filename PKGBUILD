# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-citadel
modname=citadel
srvname=forge
pkgver=1.12.6
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/citadel'
arch=('any')
license=('unlicensed')
pkgdesc="Citadel is a Library mod required for advanced animations and entity properties in 1.14 and beyond."

source=(https://mediafiles.forgecdn.net/files/3872/415/citadel-1.12.6-1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.96")
provides=(citadel=$pkgver)
noextract=($modname-$pkgver-$minver.jar)
sha256sums=('f97018e8b4ad5fc5162f524a2bf4511511c618f33765a3f9f7704a94555a7ec0')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
