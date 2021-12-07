# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.5
pkgrel=1
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
	'qt5-svg'
	'qt5-wayland'
	'libdbusmenu-qt5'
	'xxhash'
	'kwayland'
	'glibmm'
	'rnnoise'
	'jemalloc'
	'libtg_owt'
)
optdepends=(
	'webkit2gtk: embedded browser features'
	'xdg-desktop-portal: desktop integration'
)
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
provides=('kotatogram-desktop')
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('8e812cb3dca4180749367a74162d87ca54a210955ef144f72d358607643647030883e5cd5a42792e0f0fa13007fec5e6f1ec3c578373d2737eaf125c0a353189')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
