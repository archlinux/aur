# Maintainer: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>
pkgname=y-cruncher
pkgver=0.7.7.9500
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.xz")
sha512sums=('54f5950c38485d129f9d9b45324304e9e740a30b1b3f1c37a3d45b60f7611d3e71a213257fd854276827c23d37f274b182388c33e904520cbb015b9233ced503')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"05-A64 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
