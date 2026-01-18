# Maintainer: Kristofers Solo <dev at kristofers dot xyz>

_basename=mullvad-vpn
_svname=mullvad-daemon
pkgname=${_basename}-runit
pkgver=20260118
pkgrel=1
pkgdesc="runit service files for Mullvad VPN daemon"
arch=("any")
url="https://mullvad.net"
license=("GPL-3.0-or-later")
depends=("runit" "mullvad-vpn")
provides=("mullvad-vpn-service")
source=("${_svname}.run")
sha256sums=("8e13213326ba67ed3059b4ac3603fdb09fc38ca2c795ac06337e6c7e5a6e860b")

package() {
    install -Dm755 "$srcdir/${_svname}.run" "$pkgdir/etc/runit/sv/${_svname}/run"
}
