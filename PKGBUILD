# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=oculus-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rule for Oculus Rift"
arch=('any')
url="http://www.oculusvr.com/"
license=('custom')
source=('83-oculus.rules')
sha256sums=('26279a271b31c1163b34986a6745eed18408fff4b669d53515dfa9e35dfa85db')
install='oculus-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-oculus.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
