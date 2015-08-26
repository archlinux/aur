# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

pkgname=adom
pkgver=60
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=("i686" "x86_64" "armv6h")
conflicts=("adom")
provides=("adom")
depends=("ncurses")
url="http://www.adom.de/"
license=('custom: "adom"')

_source_url="http://www.ancardia.com/download/"
source=(LICENSE)
source_i686=(${_source_url}/adom_linux_debian_32_r${pkgver}_pub.tar.gz)
source_x86_64=(${_source_url}/adom_linux_debian_64_r${pkgver}_pub.tar.gz)
source_armv6h=(${_source_url}/adom_linux_arm_r${pkgver}_pub.tar.gz)

sha1sums=("51d28fe3f0420cd354113fd7ceb2a1a7abf1b069")
sha1sums_i686=("da7e253e4384dc5ae703cd80b0c84262add69209")
sha1sums_x86_64=("3731dd0211d66f493d27b93e760ad3bf8ebfea0f")
sha1sums_armv6h=("1f24ad48b9ba56e930417afefe08fb4f481bb8a1")

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
