# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=u2f-udev
pkgver=1.0.0
pkgrel=1
pkgdesc="Udev rules for FIDO U2F keys"
arch=('any')
url="https://github.com/Yubico/libu2f-host"
license=('GPLv3')
install="${pkgname}.install"
conflicts=('libu2f-host')
source=("https://raw.githubusercontent.com/Yubico/libu2f-host/master/70-u2f.rules")
md5sums=('0f3b507d1ae3a90d88e4dc600a1b6fd0')

package() {
  # install udev rules
  install -dm755 "${pkgdir}"/usr/lib/udev/rules.d
  install -m644 "70-u2f.rules" "${pkgdir}/usr/lib/udev/rules.d/70-u2f.rules"
}

# vim: ts=2 sw=2 et:
