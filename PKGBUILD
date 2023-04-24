# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=maxfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A nice fetching program written in sh"
arch=("any")
url="https://github.com/jobcmax/maxfetch"
license=("GPL")
depends=("bash")
provides=("maxfetch")
source=("${pkgname}::https://raw.githubusercontent.com/jobcmax/maxfetch/main/maxfetch")
sha256sums=("SKIP")

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 maxfetch "${pkgdir}/usr/bin/maxfetch"
}
