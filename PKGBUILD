# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=17.5.25
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
source=('https://github.com/nstinus/nordvpn.git#8bedcb2')
sha1sums=('SKIP')
install=${pkgname}.install

package() {
    install -D -m 755 ../nordvpn $pkgdir/usr/bin/nordvpn
}
