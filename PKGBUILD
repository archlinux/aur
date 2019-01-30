# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

pkgname=adom
epoch=1
pkgver=3.3.3
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=("i686" "x86_64" "armv6h")
depends=("ncurses5-compat-libs")
url="http://www.adom.de/"
license=('custom: "adom"')

_source_url="https://www.adom.de/home/download/current"
source=(LICENSE)
source_i686=(${_source_url}/adom_linux_debian_32_${pkgver}.tar.gz)
source_x86_64=(${_source_url}/adom_linux_debian_64_${pkgver}.tar.gz)
source_armv6h=(${_source_url}/adom_linux_arm_${pkgver}.tar.gz)

sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
sha1sums_i686=('3c0d19dfb1543cd7c8bb3e7a1e232f3dd7c4905f')
sha1sums_x86_64=('ed5cd8227164a778783424d74f46712e1912c1b1')
sha1sums_armv6h=('eae4cfbca91d0761d08f2d9dd91c47628ef722b7')

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom/LICENSE
}
