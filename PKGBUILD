# Maintainer : Adrien Czerny <adrien@czerny.fr>

pkgname=cinnamon-applet-weather
pkgver=3.6.8
pkgrel=1
epoch=1
pkgdesc="View your local weather forecast"
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/17"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip")
sha512sums=('851714bc92ebc75cf371c657798a06819b2a2a3d468b195ebf07ac2de11124da2a740049bfe8f8016cde6a6764acfd409e18a38c5f95601cf4619da4c262321f')
_applet=weather@mockturtl

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
