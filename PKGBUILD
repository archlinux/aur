# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=oculus-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rule for Oculus Rift"
arch=('any')
url="http://www.oculusvr.com/"
license=('custom')
source=('83-oculus.rules')
sha256sums=('da0241898eda902d8e5ac95ba3138b47be856fe06f59f010e982e7b2978749ca')
install='oculus-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-oculus.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
