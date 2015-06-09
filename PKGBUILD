# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=sane-gt68xx-ps1dfw
pkgver=1
pkgrel=1
pkgdesc="Firmware for the Mustek BearPaw 1200 CU plus scanner and clones"
arch=('any')
url="http://www.meier-geinitz.de/sane/gt68xx-backend"
license=('custom')
depends=('sane')
source=("http://www.meier-geinitz.de/sane/gt68xx-backend/firmware/PS1Dfw.usb")
md5sums=('eca04dc02952503ac75fda3a42f3257e')

package() {
  install -Dm644 "$srcdir/PS1Dfw.usb" "$pkgdir/usr/share/sane/gt68xx/PS1Dfw.usb"
}
