# Maintainer : Adrien Czerny <adrien@czerny.fr>

pkgname=cinnamon-applet-weather
pkgver=3.3.1
pkgrel=1
pkgdesc="A flexible menu with grid or list layout options, file browser and emoji search."
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/322"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip")
sha512sums=('049b21184d716b6609114a41d9e356bad57715409815482ec8326818d3027e9c856167f7a58ba181315351a1fb313dee9efa72e446c1e747f0ec538dbe48e1b0')
_applet=weather@mockturtl

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
