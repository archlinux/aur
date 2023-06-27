# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=maxfetch
pkgver=1.2.0
pkgrel=1
pkgdesc="A nice fetching program written in sh"
arch=("any")
url="https://github.com/jobcmax/maxfetch"
license=("GPL")
depends=("bash")
provides=("maxfetch")
source=("${pkgname}::https://raw.githubusercontent.com/jobcmax/maxfetch/main/maxfetch")
sha256sums=("0a71270e123fbe5b67f559dffc81ac7321c3611b277c359b1ef27afae28af13d")

package() {
	mkdir -p "${pkgdir}"/usr/bin
	install -m755 maxfetch "${pkgdir}"/usr/bin/maxfetch
}
