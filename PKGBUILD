# Maintainer: Neko-Life <nekolife123579 at gmail dot com>
# See also https://github.com/Neko-Life-aur/dpp-bin
#
# Contributor: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-bin
pkgname=dpp-bin
pkgver=10.0.27
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - binary version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("https://raw.githubusercontent.com/Neko-Life-aur/dpp-bin-artifacts/main/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('2367413929d3bab6d4fc7b064ed1efedb4405c8305b9edb8c3cecbcb6939fcf4')
validpgpkeys=('988B124407F072AACFA92D2F52B5096DD205E14A')

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "usr" "${pkgdir}/usr"
}
