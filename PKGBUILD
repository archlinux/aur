# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.1
pkgrel=4
_pkgrel=3
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
sha512sums=('b910e584c4ec0440e2a316ae288863567214463dbd32aabe6c6392fc5e7c617fdc31737ca817c1013b16762ccd5cfd5af467b6b0562c5f20168dc177b48ec186')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
