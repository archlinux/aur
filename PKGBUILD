# Maintainer : Felix Golatofski <contact@xdfr.de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-hardware-monitor
pkgver=1.3
pkgrel=1
pkgdesc="Graphical hardware monitor displaying your realtime CPU and memory load with colored charts"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/12"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'libgtop')
source=("https://cinnamon-spices.linuxmint.com/files/applets/hwmonitor@sylfurd.zip")
sha512sums=('8ad338bbfed5347429913dbf7668e70bdf2ac3d119cdbdda86e05ff552ceca8a70696401abddc746304997a69d90a09eff8ae49f7845e4d29368d4a83f696cc9')
_applet=hwmonitor@sylfurd

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
