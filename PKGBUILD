# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.1
pkgrel=2
_pkgrel=1
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
	'gtk3'
	'glibmm'
	'webkit2gtk'
)
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
provides=('kotatogram-desktop')
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('e04c34053ebdc2b1823631c9e10d27fa43c811f5e2450647bb99bcef5180fd5a1710d42fea73627e44cb1cc70db6c717ae6f5563238075cb21cb7f62bf5a2ccf')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
