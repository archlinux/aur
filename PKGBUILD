# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=17.5.24
pkgrel=11
pkgdesc="OpenVPN helper script for nordvpn.com"
arch=(any)
url="http://www.nordvpn.com"
license=('MIT')
depends=('openvpn' 'systemd' 'openvpn-update-resolv-conf-git' 'curl' 'unzip' 'coreutils')
optdepends=('iputils: run ping and rank functions'
            'vpnfailsafe-git: use instead of update-resolv-conf if available')
makedepends=('coreutils')
provides=('nordvpn')
install=${pkgname}.install

package() {
    install -D -m 755 ../nordvpn $pkgdir/usr/bin/nordvpn
}
