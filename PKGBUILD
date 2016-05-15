# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=vive-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rule for the Vive for the group \"plugdev\""
arch=('any')
url="https://github.com/OpenHMD/OpenHMD/commit/c29c99712d6f67a3921cb531a0c74f5f5109cb0f"
license=('custom')
source=('83-vive.rules')
sha256sums=('156d93b59942d89c3838f3ae2f45bd832226d19e1f7f04797f9cb640a09a3124')
install='vive-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-vive.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
