# Maintainer: Niccolò Maggioni <nicco.maggioni@gmail.com>
# Credits to Derek Pressnall (http://askubuntu.com/a/33192/440625)

pkgname=delayed_hibernation
pkgver=1.0
pkgrel=1
pkgdesc="Script to hibernate the computer after having spent some time in suspension"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?pid=1554259"
license=('MIT')
depends=('systemd' 'bash')
install=delayed_hibernation.install
source=(delayed_hibernation.sh delayed_hibernation.conf)
md5sums=('36867d9b80ab9c94f5cbecae85e32dda' '0fe21901bbc6f9ce9e8a85e5ec7a3eaf')

package() {
  install -Dm 755 $srcdir/delayed_hibernation.sh ${pkgdir}/usr/lib/systemd/system-sleep/delayed_hibernation.sh
  install -Dm 644 $srcdir/delayed_hibernation.conf ${pkgdir}/etc/delayed_hibernation.conf
}
