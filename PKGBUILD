# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.1
pkgrel=3
_pkgrel=2
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
sha512sums=('b4be5e2b555178cb6ea8d38b080659c5d5dcec81f64430daada92c66128634538f83bcacafe9b76f1828c6ceec4633b8d063e04bef0d26586145ec75b841f7c4')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
