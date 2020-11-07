# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=nordvpn-configs
pkgver=1.0.0
pkgrel=1
pkgdesc="openvpn config files for NordVPN"
arch=('any')
url='https://nordvpn.com/'
optdepends=(
	'openvpn: Run the client configs with systemd and openvpn'
)
source=(
	"$pkgname.zip::https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip"
)
sha256sums=(
	'385c7c9437efa33f44df08b5771a017bd7ee377e0fe50eec1a0926450ac591bb'
)
package() {
	install --mode=755 --directory "$pkgdir/etc/openvpn/client"
	install -D --mode=644 **/*.ovpn "$pkgdir/etc/openvpn/client"
}

# https://jlk.fjfi.cvut.cz/arch/manpages/man/PKGBUILD
