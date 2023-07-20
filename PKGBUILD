# Maintainer: Kristofers Solo <dev@kristofers.xyz>
_pkgname="tuxedo-control-center"
pkgname="${_pkgname}-runit"
pkgver=1.0.2
pkgrel=1
pkgdesc="runit service for TUXEDO Control Center "
arch=("x86_64")
url="https://aur.archlinux.org/packages/tuxedo-control-center-runit"
license=("GPL")
depends=("runit" "tuxedo-control-center-bin")
source=("tccd.run")
sha256sums=("f92a399d380b2e88207d59227395cf7315e015f24fee8dfe12c0b31ee89546f9")

package() {
	install -Dm755 ./tccd.run "${pkgdir}/etc/runit/sv/tccd/run"
}
