# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=vive-udev
pkgver=1
pkgrel=2
pkgdesc="Udev rule for the Vive for the group \"plugdev\""
arch=('any')
url="https://github.com/OpenHMD/OpenHMD/commit/c29c99712d6f67a3921cb531a0c74f5f5109cb0f"
license=('custom')
source=('83-vive.rules')
sha256sums=('2c1b95772e652fa738b60462bdf2276ddb4536c29e70fcd96fc8865a2fe7a790')
install='vive-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-vive.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
