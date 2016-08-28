# Maintainer: ShareDVI <amateush@ya.ru>

pkgname=bcm43142-firmware
pkgver=1
pkgrel=1
pkgdesc="Firmware for BCM43142 bluetooth chip (0a5c:21d7)"
arch=('any')
url="https://www.broadcom.com/support/bluetooth"
license=("Custom")
source=("fw-0a5c_21d7.hcd::https://github.com/ShareDVI/bcm43142-firmware/raw/master/fw-0a5c_21d7.hcd")
sha256sums=('ca4cad2370dfb21b6eab3b67a2eed6b13aeb9af208d365767d1b789e1711007a')

package() {
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm
  install -m644 "${srcdir}/fw-0a5c_21d7.hcd" "${pkgdir}/usr/lib/firmware/fw-0a5c_21d7.hcd"
  install -m644 "${srcdir}/fw-0a5c_21d7.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM.hcd"
}


