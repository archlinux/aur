# Maintainer : Felix Golatofski <contact@xdfr.de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-hardware-monitor
pkgver=1.3.1
pkgrel=1
pkgdesc="Graphical hardware monitor displaying your realtime CPU and memory load with colored charts"
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/12"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'libgtop' 'libgudev')
source=("https://cinnamon-spices.linuxmint.com/files/applets/hwmonitor@sylfurd.zip")
sha512sums=('42d380e4323b25c9eca67da8d90ba08b678a475e1ecf4c7369281932745384065a6a42416e02c2a37d077a3629fb93c68f81c336b90471a4c7427ebadeef7625')
_applet=hwmonitor@sylfurd

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
