# Maintainer: Pierre Ayoub <pierreay@proton.me>

pkgname=gqrx-udev
pkgver=2.10
pkgrel=1
pkgdesc="GQRX's udev rules matching popular Software-Defined Radios (SDRs)."
arch=(any)
url="https://www.gqrx.dk/"
license=('GPL-3.0-or-later')
install="udev.install"
source=("https://github.com/gqrx-sdr/gqrx/releases/download/v${pkgver}/gqrx-sdr-${pkgver}-linux-x64.tar.xz")
sha256sums=('b32c2eebfa6ecda9631910599e6d0a01c7a30ecd636c4f4499e9a1d2de3e6389')

package() {
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/52-airspy.rules"    "${pkgdir}/usr/lib/udev/rules.d/52-gqrx-udev-airspy.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/52-airspyhf.rules"  "${pkgdir}/usr/lib/udev/rules.d/52-gqrx-udev-airspyhf.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/53-hackrf.rules"    "${pkgdir}/usr/lib/udev/rules.d/53-gqrx-udev-hackrf.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/54-plutosdr.rules"  "${pkgdir}/usr/lib/udev/rules.d/54-gqrx-udev-plutosdr.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/64-limesuite.rules" "${pkgdir}/usr/lib/udev/rules.d/64-gqrx-udev-limesuite.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/66-mirics.rules"    "${pkgdir}/usr/lib/udev/rules.d/66-gqrx-udev-mirics.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/fcd.rules"          "${pkgdir}/usr/lib/udev/rules.d/gqrx-udev-fcd.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/fcdpp.rules"        "${pkgdir}/usr/lib/udev/rules.d/gqrx-udev-fcdpp.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/rtl-sdr.rules"      "${pkgdir}/usr/lib/udev/rules.d/gqrx-udev-rtl-sdr.rules"
	install -Dm644 "${srcdir}/gqrx-sdr-${pkgver}-linux-x64/udev/sdriq.rules"        "${pkgdir}/usr/lib/udev/rules.d/gqrx-udev-sdriq.rules"
}
