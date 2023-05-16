# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-bin
pkgname=dpp-bin
pkgver=10.0.23
pkgrel=2
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - binary version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("https://github.com/eremiell-aur/${pkgname%-bin}/releases/download/${pkgver}-${pkgrel}/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
	"https://github.com/eremiell-aur/${pkgname%-bin}/releases/download/${pkgver}-${pkgrel}/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.asc")
sha256sums=('34cd4d7d50895f8172a8690d3520ce2de0a0d160aaaa07bc474994bc2b7c48a3'
            'SKIP')
validpgpkeys=('988B124407F072AACFA92D2F52B5096DD205E14A')

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "usr" "${pkgdir}/usr"
}
