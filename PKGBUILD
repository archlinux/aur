# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.1
pkgrel=5
_pkgrel=4
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Precompiled package"
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
depends=(
	'hunspell'
	'ffmpeg'
	'hicolor-icon-theme'
	'lz4'
	'minizip'
	'openal'
	'ttf-opensans'
	'qt5-imageformats'
	'xxhash'
	'libdbusmenu-qt5'
	'kwayland'
	'glibmm'
)
optdepends=(
	'gtk3: GTK integration'
	'webkit2gtk: Web-related features'
)
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
provides=('kotatogram-desktop')
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('f91cb699912bcd04c95b991754a3027908dfa09cbbceeb93fd45a902c45d6b68c8f82f8a07e0da5d32601fc75eec4865f410d099073de21f44e71926294dc736')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
