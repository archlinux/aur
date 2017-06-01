# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=17.6.1
pkgrel=12
pkgdesc="OpenVPN helper script for nordvpn.com"
arch=(any)
url="https://github.com/nstinus/nordvpn"
license=('MIT')
depends=('openvpn' 'systemd' 'openvpn-update-resolv-conf-git' 'curl' 'unzip' 'coreutils')
optdepends=('iputils: run ping and rank functions'
            'vpnfailsafe-git: use instead of update-resolv-conf if available')
makedepends=('coreutils')
provides=('nordvpn')
source=('git+https://github.com/nstinus/nordvpn.git#commit=2cff124')
sha1sums=('SKIP')
install=${pkgname}.install

package() {
    install -D -m 755 nordvpn/nordvpn $pkgdir/usr/bin/nordvpn
}
