# Maintainer : Adrien Czerny <adrien@czerny.fr>

pkgname=cinnamon-applet-weather
pkgver=3.8
pkgrel=1
pkgdesc="View your local weather forecast"
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/17"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip")
sha512sums=('ca947731d0dabb647a66d1b20ca7785c93605098b50642dfd6401c6bc83e52c08c688552cc3cd95c4a660030ad0ec426a3b7511feaf521a3e5b88fe89748bc91')
_applet=weather@mockturtl

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
