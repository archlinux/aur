# Maintainer : Felix Golatofski <contact@xdfr.de>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=cinnamon-applet-hardware-monitor
pkgver=1.3
pkgrel=2
pkgdesc="Graphical hardware monitor displaying your realtime CPU and memory load with colored charts"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/12"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'libgtop' 'libgudev')
source=("https://cinnamon-spices.linuxmint.com/files/applets/hwmonitor@sylfurd.zip")
sha512sums=('7017c424604a3d9a6c77d0b0ff2dbf0cd1c2d612f615b22e8c569107487d4eede188ed1f1795d718df4d92440b94d0333326dc9d4269b9503bb6ceb167930bfc')
_applet=hwmonitor@sylfurd

package() {
  cd $srcdir/$_applet
  install -dpm755 $pkgdir/usr/share/cinnamon/applets/$_applet
  find * -type f -exec install -Dpm644 {} $pkgdir/usr/share/cinnamon/applets/$_applet/ \;
}
