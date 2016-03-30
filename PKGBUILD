# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=oculus-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rule for Oculus Rift"
arch=('any')
url="http://www.oculusvr.com/"
license=('custom')
source=('83-oculus.rules')
sha256sums=('8e965452d665c6134d82c7b293a6013b74975327f57a13a5f6bc6f59ed690fc2')
install='oculus-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-oculus.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
