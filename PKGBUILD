pkgname=y-cruncher
pkgver=0.7.1.9466
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.gz")
sha256sums=('f7d86d153bcfbf465b9a9a7b1193eeb1988637206e355358e31cb1c784c1c3de')
sha512sums=('6e6b66d81edde5e2a673f418cfb7baf63ee8fffb4964b418c65ab15fe39192f70877445a0140537d267235729a0ce201e1bbede1675ef3f4981115266ff5f1db')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"x64 SSE3 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
