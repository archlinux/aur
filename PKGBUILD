pkgname=y-cruncher
pkgver=0.7.3.9474
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.gz")
sha256sums=('dd4015fa2849ed16a5db3a36b55e438aa9f6615f6b3509540625d75418a45ad6')
sha512sums=('a7b6c488aa7abca402b495edc30bc147267d2f3f6501581d30339246fc445a02a6fbd7dac508d2099bdbd252228e746d0b5c853a18b769bbf85f572880cd7c73')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"05-A64 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
