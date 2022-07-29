# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-bookshelf
modname=bookshelf
srvname=forge
pkgver=14.1.7
minver=1.19
pkgrel=2

url='https://www.curseforge.com/minecraft/mc-mods/bookshelf'
arch=('any')
license=('GPL')
pkgdesc="Bookshelf is a collection of code, frameworks, utilities, and other resources. Many mods utilize Bookshelf's code base to power their own mods."

source=(https://mediafiles.forgecdn.net/files/3871/514/Bookshelf-Forge-1.19-14.1.7.jar)
depends=("forge-server"
         "forge-server-hooks")
noextract=(Bookshelf-Forge-1.19-14.1.7.jar)
sha256sums=('878845ccb5934d1f84bf3b418021637bf74c35237b402e64a0c2424e86886566')

package() {
  install -Dm 2755 $srcdir/Bookshelf-Forge-1.19-14.1.7.jar $pkgdir/srv/$srvname/mods/$modname.jar
}
