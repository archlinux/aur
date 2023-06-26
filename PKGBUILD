# Maintainer : Adrien Czerny <adrien@czerny.fr>

pkgname=cinnamon-applet-cinnamenu
pkgver=5.8
pkgrel=1
pkgdesc="A flexible menu with grid or list layout options, file browser and emoji search."
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/322"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip")
sha512sums=('bf76f5aef2d466e145a49d53da4623b2762c755316985a2b102c5466910f9a6637a0114410a4604347652cc531be0ab41dca87bf8643b69aa6b6d83640cffafb')
_applet=Cinnamenu@json

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
