# Maintainer: Stefan Richter (sealor) <jdevsr3 googlemail com>
pkgname=plusberrypi-shutdown
pkgver=1.0.0
pkgrel=1
pkgdesc="A systemd service for shutting down your PlusberryPi with the power button."
arch=('armv6h' 'armv7h')
url="http://plusberrypi.com"
license=('GPL')
depends=('systemd' 'bash')
source=('plusberrypi-shutdown.service' 'plusberrypi-shutdown.sh')
md5sums=('3b61dc69b028543e40ca60ff4b0833e9'
         'b531ced76846544496701af6983062ad')

package() {
  install -m 644 -D -t $pkgdir/etc/systemd/system/ $srcdir/plusberrypi-shutdown.service
  install -m 744 -D -t $pkgdir/usr/bin/ $srcdir/plusberrypi-shutdown.sh
}
