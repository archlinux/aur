# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-hardware-monitor
pkgver=1.0
pkgrel=2
pkgdesc="Graphical hardware monitor displaying your realtime CPU and memory load with colored charts"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/12"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'libgtop')
source=("https://cinnamon-spices.linuxmint.com/files/applets/hwmonitor@sylfurd.zip")
sha512sums=('da5068c0a3b3685e769410100377a436dfc11517111f8d70942d0f656ea7bcf88ef0a6772e769e2d22f90c9909c4ae951dd02bd4d5c2f9569c4a9728ce463bb7')
_applet=hwmonitor@sylfurd

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
