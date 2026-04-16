# Maintainer: Henonicks <sawsawsa777 at gmail dot com>
# See also https://github.com/Henonicks/dpp-bin
#
# Contributor: Neko-Life <nekolife123579 at gmail dot com>
# See also https://github.com/Neko-Life-aur/dpp-bin
#
# Contributor: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-bin
pkgname=dpp-bin
pkgver=10.1.4
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - binary version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'opus')
changelog="${pkgname}.changelog"
source=("https://raw.githubusercontent.com/Henonicks/dpp-bin/main/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('193a60bf5cc34c308823d7590357e9bf6eb9618fc4a129a671bf2041ce752471')
validpgpkeys=('EDCEFB1FDAFFAC7952EED46F9927644B850BDD23')

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "usr" "${pkgdir}/usr"
}
