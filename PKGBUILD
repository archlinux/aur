pkgname=y-cruncher
pkgver=0.6.9.9464
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.gz")
sha256sums=('a1bb9faacd7d0fe4635d6ee906ac7428f7217b40cf7a0e4469bd6d2c54097f0d')
sha512sums=('e8f6f202bb84bdf95dcbcd6f9ff6392b1cfbf2f73c1de5295f5e67c1756b6b4ef2a7fb6a9e0ec43b86839e9ae1027a29961b8f3084cde48bfbd444897d51cf3e')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"x64 SSE3 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}

