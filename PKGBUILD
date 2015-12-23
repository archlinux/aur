# Maintainer: gabe <thesqrtminus1 at gmail dot com> (also thesqrtminus1.com) [also this is my first time working with git please don't hurt me]
pkgname=y-cruncher
pkgver=0.6.9.9462
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.gz")
sha256sums=('08b038dd37f3d3f82250e6456b9c1e3a95774f7c57f1a0813cfaa06666fb20d4')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"x64 SSE3 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
