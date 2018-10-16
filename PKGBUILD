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
sha512sums=('56e1cea980ca0d7bff2232414bc7daf1fbcf97e9033ec3ae6ff7f3efe59d1c541d81a9efdab876152e0f3bbdf5ae05be294fb4e74be20e6ebad848972e9c5b50')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"05-A64 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
