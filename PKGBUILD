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
	'SKIP'
)
package() {
	install --mode=755 --directory "$pkgdir/etc/openvpn/client"
	install -D --mode=644 **/*.ovpn "$pkgdir/etc/openvpn/client"
}

# https://jlk.fjfi.cvut.cz/arch/manpages/man/PKGBUILD
