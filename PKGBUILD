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
source=("${pkgname}::https://github.com/jobcmax/maxfetch/releases/download/stable/maxfetch")
sha256sums=("0d398be32cf8584d92b935053086be1478fe043ce07f7119359268d732a5068b")

package() {
	mkdir -p "${pkgdir}"/usr/bin
	install -m755 maxfetch "${pkgdir}"/usr/bin/maxfetch
}
