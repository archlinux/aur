# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=maxfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A nice fetching program written in sh"
arch=("any")
url="https://github.com/jobcmax/maxfetch"
license=("GPL")
depends=("bash")
provides=("maxfetch")
source=("${pkgname}::https://raw.githubusercontent.com/jobcmax/maxfetch/main/maxfetch")
sha256sums=("83451b2f67db4cd888635a1671a63d422387330110e35d559fba3d6c3fb75ca4")

package() {
	mkdir -p "${pkgdir}"/usr/bin
	install -m755 maxfetch "${pkgdir}"/usr/bin/maxfetch
}
