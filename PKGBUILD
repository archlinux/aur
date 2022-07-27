# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-architectury
modname=architectury
srvname=forge
pkgver=5.10.33
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/architectury-api'
arch=('any')
license=('GPL')
pkgdesc="Architectury API is an api to abstract calls to fabric api and forge api as both loader has different implementations of what can be perceived as the same thing."

source=(https://mediafiles.forgecdn.net/files/3893/635/architectury-5.10.33-forge.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-$srvname.jar)
sha256sums=('49d324ec91b016358450efb6215878d738d8320835652168f68c63145a4a3af6')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-$srvname.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
