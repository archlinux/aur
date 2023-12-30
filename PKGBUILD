# Maintainer: Neko-Life <nekolife123579 at gmail dot com>
# See also https://github.com/Neko-Life-aur/dpp-bin
#
# Contributor: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-bin
pkgname=dpp-bin
pkgver=10.0.29
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - binary version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("https://raw.githubusercontent.com/Neko-Life-aur/dpp-bin-artifacts/main/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('e97e7c776627f67d613bf6850e16618f108d71fe3f731eb651efef63216c989a')
validpgpkeys=('988B124407F072AACFA92D2F52B5096DD205E14A')

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "usr" "${pkgdir}/usr"
}
