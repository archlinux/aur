# Maintainer: Ranieri Althoff <ranisalt at gmail dot com>

pkgname=nordconnect
pkgver=0.1.0
pkgrel=1
pkgdesc='Connect to a NordVPN server'
arch=('any')
url='https://gitlab.com/ranisalt/nordconnect'
license=('GPL3')
depends=('openvpn')
optdepends=('nordselect: select the ideal server'
            'openvpn-update-systemd-resolved: use NordVPN DNS servers with systemd-resolved')
source=(nordconnect)
sha256sums=('fcbece552d66bc97073e6578e27417bdc95a89c7b768ee82c606c996c3998915')

package() {
  install -Dm755 nordconnect "${pkgdir}/usr/bin/nordconnect"
}

# vim:set ts=2 sw=2 et:
