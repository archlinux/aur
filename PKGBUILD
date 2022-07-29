# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-darkpaintings
modname=darkpaintings
srvname=forge
pkgver=11.0.2
minver=1.19
pkgrel=2

url='https://www.curseforge.com/minecraft/mc-mods/dark-paintings'
arch=('any')
license=('GPL')
pkgdesc="This mod adds a large variety of new paintings to the game. These paintings are seamlessly integrated with the vanilla paintings and are placed in the world using the normal painting item."

source=(https://mediafiles.forgecdn.net/files/3823/331/DarkPaintings-Forge-1.19-11.0.2.jar)
depends=("forge-server=41.1.0"
         "forge-server-hooks=1.0.0"
         "forge-server-bookshelf=14.1.7")
noextract=(DarkPaintings-Forge-$minver-$pkgver.jar)
sha256sums=('91d5f5fc839f324362a5621147806b5bcec754d3a16d40f075865ec158a981ab')

package() {
  install -Dm 2755 $srcdir/DarkPaintings-Forge-$minver-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
