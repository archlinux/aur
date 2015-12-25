# Maintainer: gabe <thesqrtminus1 at gmail dot com> (also thesqrtminus1.com)
# also this is my first time working with git please don't hurt me

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
sha512sums=('e83658c34b65a77717b5b46def5e8bcc537533d1224dbcac498d546762d1eb8494c068d935a574256c0cd7c0434070fac37aa9ebeedfa56eb1c21a84121a9842')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"x64 SSE3 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}

