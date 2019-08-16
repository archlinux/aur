# Maintainer: Felix Morgner <felix.morgner@gmail.com

pkgname=librem-key-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='Udev rules to allow the wheel group access to the Librem Key'
arch=('any')
license=('GPL2')
source=('51-librem-key.rules')
depends=('systemd')
install='librem-key-udev.install'
md5sums=('ffae0fb25bc851a4a0c062a88b1930f4')

package() {
  mkdir -p $pkgdir/usr/lib/udev/rules.d/
  cp 51-librem-key.rules $pkgdir/usr/lib/udev/rules.d/
  chmod a+r $pkgdir/usr/lib/udev/rules.d/51-librem-key.rules
}
