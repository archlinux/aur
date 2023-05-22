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
sha256sums=("716a6061d1b7f83485dd58fb85b327c088d977454e9ebbcfbadf45101b6edfea")

package() {
	mkdir -p "${pkgdir}"/usr/bin
	install -m755 maxfetch "${pkgdir}"/usr/bin/maxfetch
}
