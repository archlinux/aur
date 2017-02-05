pkgname=psvr-udev
pkgver=1
pkgrel=2
pkgdesc="Udev rule for the PSVR"
arch=('any')
url="https://www.playstation.com/en-us/explore/playstation-vr/"
license=('custom')
source=('83-psvr.rules')
install='psvr-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-psvr.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
md5sums=('aa0cadfab0837bced7b442b275768c46')
