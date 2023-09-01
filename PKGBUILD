# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-bin
pkgname=dpp-bin
pkgver=10.0.25
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - binary version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("https://github.com/eremiell-aur/${pkgname%-bin}/releases/download/${pkgver}-${pkgrel}/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
	"https://github.com/eremiell-aur/${pkgname%-bin}/releases/download/${pkgver}-${pkgrel}/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.asc")
sha256sums=('f09398c853afb1a9551adef4515c187c72b49007a797af4d53d70e5905681aaa'
            'SKIP')
validpgpkeys=('988B124407F072AACFA92D2F52B5096DD205E14A')

package() {
	cd "${srcdir}"
	cp -a --reflink=auto "usr" "${pkgdir}/usr"
}
