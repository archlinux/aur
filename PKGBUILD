# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.2
pkgrel=1
_pkgrel=1
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Precompiled package"
arch=(x86_64)
url="https://kotatogram.github.io"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
	xxhash
	zlib
	minizip
	openssl
	libdbusmenu-qt5
	hunspell
	libtgvoip
	hicolor-icon-theme
)
optdepends=(
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz")
sha512sums=('95a4f99b596b5019daff8eb107c33ce4cc613227a92f5375247a5d3d393cd8a0ad01514a7993580cb464cf8c781f8cc6c77aa1b483d0b8f81ccdeb56df126e13')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz" -C "$pkgdir" --exclude=".*"
}
