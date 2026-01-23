# Maintainer: Kristofers Solo <dev at kristofers dot xyz>

_basename=mullvad-vpn
_svname=mullvad-daemon
pkgname=${_basename}-runit
pkgver=20260123
pkgrel=1
pkgdesc="runit service files for Mullvad VPN daemon"
arch=("any")
url="https://mullvad.net"
license=("GPL-3.0-or-later")
depends=("runit" "mullvad-vpn")
provides=("mullvad-vpn-service")
source=("${_svname}.run")
sha256sums=("5affc5eea611b4328e2a3859994ac43178c0d3a5e00ad8783fccae52de83e6db")

package() {
    install -Dm755 "$srcdir/${_svname}.run" "$pkgdir/etc/runit/sv/${_svname}/run"
}
