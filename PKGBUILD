# Maintainer: Kristofers Solo <dev@kristofers.xyz>
_pkgname="tuxedo-control-center"
pkgname="${_pkgname}-runit"
pkgver=1.0.3
pkgrel=1
pkgdesc="runit service for TUXEDO Control Center "
arch=("x86_64")
url="https://aur.archlinux.org/packages/tuxedo-control-center-runit"
license=("GPL")
depends=("runit" "tuxedo-control-center-bin")
source=("tccd.run")
sha256sums=("d3be7c0c237d928b63c6a35ff667ac9c36078162a6db4f329ae212181f80bc9f")

package() {
	install -Dm755 ./tccd.run "${pkgdir}/etc/runit/sv/tccd/run"
}
