# Maintainer: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: <kfgz at interia dot pl>

pkgname=y-cruncher
pkgver=0.6.8.9461
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=(y-cruncher-${pkgver}.tar.gz::"http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}.tar.gz")
sha256sums=('c01cce26ac61099e9b5e727b20f70513f5bd436d464b7b6497ba405483ae43c6')

package() {
  install -D -m755 ${srcdir}/"y-cruncher v${pkgver}/Binaries"/"x64 SSE3 ~ Kasumi.out" \
                   ${pkgdir}/usr/bin/y-cruncher
}
