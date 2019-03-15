# Maintainer: SilverMight <silver at silvermight dot com>
# Contributor: Bastian Plettner <b.pletttner at archlinux dot info>
# Contributor: thesqrtminus1  <thesqrtminus1 at gmail dot com>
# Contributor: kstolp <kevinstolp at gmail dot com>
# Contributor: kfgz <ffiasd at gmail dot com>
pkgname=y-cruncher
pkgver=0.7.7.9499
pkgrel=1
pkgdesc="The first scalable multi-threaded Pi-benchmark for multi-core systems."
arch=('x86_64')
url="http://www.numberworld.org/y-cruncher/"
license=('unknown')
options=(!strip)
depends=('gcc-libs')
source=("http://www.numberworld.org/y-cruncher/y-cruncher%20v${pkgver}-static.tar.xz")
sha512sums=('aabeecf4481958f49fe6874799ed2473696fdc2f36ef4ebe704851d1bae7f38199cd753503ea59ca7758737bdcc8ecfea5116117ad1828309a7625d8d72f3f72')
package() {
install -D -m755 ${srcdir}/y-cruncher\ v${pkgver}-static/Binaries/"05-A64 ~ Kasumi" ${pkgdir}/usr/bin/y-cruncher
}
