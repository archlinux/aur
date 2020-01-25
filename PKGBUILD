# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.1.5
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
	libtgvoip
	rlottie-tdesktop
	hicolor-icon-theme
	desktop-file-utils
)
optdepends=(
	'enchant: spellchecking support'
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz")
sha512sums=('c17e3bb94a2aaca054d51eb864286e8a446c10d7f9b8f014bc27986e7b078a02d675ebef5138db1c961c1351ad409493894a3dc83b480e83921e57fd7863a899')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz" -C "$pkgdir" --exclude=".*"
}
