# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

pkgname=adom
epoch=1
pkgver=2.3.8
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=("i686" "x86_64" "armv6h")
depends=("ncurses5-compat-libs")
url="http://www.adom.de/"
license=('custom: "adom"')

_source_url="http://www.ancardia.com/download"
source=(LICENSE)
source_i686=(${_source_url}/adom_linux_debian_32_${pkgver}.tar.gz)
source_x86_64=(${_source_url}/adom_linux_debian_64_${pkgver}.tar.gz)
source_armv6h=(${_source_url}/adom_linux_arm_${pkgver}.tar.gz)

sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
sha1sums_i686=('3ae506daed02d7b6c9ece1445a54bc08616f29d0')
sha1sums_x86_64=('3d08916e94b7fe039eeeb741b5f8c1e9d98cc22a')
sha1sums_armv6h=('0a161cb19375f8918484d04f99ab66d0936b0480')

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom/LICENSE
}
