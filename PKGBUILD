# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.1.4
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
sha512sums=('119b0b1dc4a85a4297b3ddcfa9bddcfff06dcb1f93d20fb733a375e92214b17fa96e8651e1f5b6741fa81f479647dc6afd8cd5bed239fa47bf2246f7c6957e51')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz" -C "$pkgdir" --exclude=".*"
}
