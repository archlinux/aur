# Maintainer: basica <aur basica at gmail dot com>
_pkgname=linux-firmware-1.144+ar3012~vivid
pkgname=qca9565-bluetooth-firmware
pkgver=1.144
pkgrel=1.1
pkgdesc="Qualcomm Atheros QCA9565 bluetooth firmware"
arch=('any')
url="https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi"
license=('custom:atheros_firmware')
source=("linux-firmware_${pkgver}.tar.gz::${url}/+files/linux-firmware_1.144%2Bar3012~vivid.tar.gz")
sha256sums=('a57ffa0ff6d80f10ebaa3878a736b2adcfccd76fb4787477d4096087e2826961')

package() {
    install -D -m644 $srcdir/${_pkgname}/ar3k/AthrBT_0x31010100.dfu     ${pkgdir}/usr/lib/firmware/ar3k/AthrBT_0x31010100.dfu
    install -D -m644 $srcdir/${_pkgname}/ar3k/ramps_0x31010100_40.dfu   ${pkgdir}/usr/lib/firmware/ar3k/ramps_0x31010100_40.dfu
    install -D -m644 $srcdir/${_pkgname}/LICENCE.atheros_firmware       ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.atheros_firmware
}
