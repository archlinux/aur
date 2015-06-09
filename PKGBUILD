# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-hardware-monitor
pkgver=1.0
pkgrel=1
pkgdesc="Graphical hardware monitor displaying your realtime CPU and memory load with colored charts"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/12"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'libgtop')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/3QIF-VVTI-L59J.zip")
md5sums=('c0bdcece52412ec9f318f925cb1ef63e')
_applet=hwmonitor@sylfurd

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
