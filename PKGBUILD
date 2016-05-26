pkgname=y-cruncher
pkgver=0.7.1.9465
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.gz")
sha256sums=('cdb9c7a73af8551ceaf2c00ec14660be666e26ba49df670d08f0e18fe10f2375')
sha512sums=('47d0000bedcdf67e58a6ed48b5b741c787d77de05073d0f14dc512f227a3a3b20af67851f77c008440dd0745e1b1b3e50ef243aba597397c7d2d281fa7132ee4')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"x64 SSE3 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}

