# Maintainer: Jenny Danzmayr <mail@evilscientress.de>

pkgname=atmel-ice-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for Atmel-ICE ISP and JTAG programmer and debugger"
arch=('any')
url="https://www.microchip.com/en-us/development-tool/ATATMEL-ICE"
license=('GPL')
depends=(systemd)
source=('99-atmel-ice.rules')
sha256sums=('c6c3807882f369b2452aa948cfcccaea0755c617d6411a0b317c07a294f47589')

package() {
    cd "${srcdir}"

    install -Dm644 "99-atmel-ice.rules" "${pkgdir}/etc/udev/rules.d/99-atmel-ice.rules"
}
