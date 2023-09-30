# Maintainer : Adrien Czerny <adrien@czerny.fr>

pkgname=cinnamon-applet-places-center
pkgver=2.2
pkgrel=1
pkgdesc=" Provides an easy-to-read layout to access your places "
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/128"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("https://cinnamon-spices.linuxmint.com/files/applets/placesCenter@scollins.zip")
sha512sums=('504cd0c1892dfb28b582d566dba3d563484e65bf8015cf7234e8c7d0ae414b34594edef5bfb39f6bec04c079c2918c8443c62ea0fb68f4f8285925350d17a99f')
_applet=placesCenter@scollins

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
