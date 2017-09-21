pkgname=y-cruncher
pkgver=0.7.3.9475
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.gz")
sha256sums=('bfde645f8be434e6b71959e14e245d27b98461b5a0ebcdafca174c716bef8a4d')
sha512sums=('d06d42298ac2ead24e4d67e55b65d951166c34b2715993e5c39d00d385c37e638dfd2469275f36da950652310b6e57681e442a746cf3dd7803b861b46a103684')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"05-A64 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
