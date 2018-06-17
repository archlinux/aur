# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

pkgname=adom
epoch=1
pkgver=3.0.6
pkgrel=2
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=("i686" "x86_64" "armv6h")
depends=("ncurses5-compat-libs")
url="http://www.adom.de/"
license=('custom: "adom"')

_source_url="https://www.adom.de/home/download/current/"
source=(LICENSE)
source_i686=(${_source_url}/adom_linux_debian_32_${pkgver}.tar.gz)
source_x86_64=(${_source_url}/adom_linux_debian_64_${pkgver}.tar.gz)
source_armv6h=(${_source_url}/adom_linux_arm_${pkgver}.tar.gz)

sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
sha1sums_i686=('6712aeb741ba669ae60e98f14296a43252fc8e2c')
sha1sums_x86_64=('f2f78352b160d5cedc0267895f754e39caf092d6')
sha1sums_armv6h=('3f1d481a91067de8b8212e8e0c99733f52dd850f')

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom/LICENSE
}
