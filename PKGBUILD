# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-bin
pkgname=dpp-bin
pkgver=10.0.24
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - binary version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("https://github.com/eremiell-aur/${pkgname%-bin}/releases/download/${pkgver}-${pkgrel}/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
	"https://github.com/eremiell-aur/${pkgname%-bin}/releases/download/${pkgver}-${pkgrel}/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.asc")
sha256sums=('3cdb3b395ba7596d1355d47acd9a9bef5d7a9dcda4224d33fa271b72bec06250'
            'SKIP')
validpgpkeys=('988B124407F072AACFA92D2F52B5096DD205E14A')

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "usr" "${pkgdir}/usr"
}
