# Maintainer: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>
pkgname=y-cruncher
pkgver=0.7.6.9487
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.xz")
sha512sums=('7ecaad1806da76a295074e6a901cdaf440d24db9dc4b2a8d2ca94faabade20aee0eaa4937d2a14737e26c42bbd05bb8c982ad1f36ec16216e8bfd13098df89fe')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"05-A64 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
