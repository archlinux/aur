# Maintainer: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.4.5
pkgrel=2
_pkgrel=2
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Precompiled package"
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'jemalloc' 'abseil-cpp')
optdepends=(
	'webkit2gtk: embedded browser features'
	'xdg-desktop-portal: desktop integration'
)
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin')
provides=('kotatogram-desktop')
source=("https://github.com/solopasha/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst")
sha512sums=('c5a52246c41132e01468bad560b8616462f8575577b99dfe0797e43944f2ef7bb1946ba9069334899378078d234d1b4c9712c7837121b2c5e7b240ea9a681ecf')
package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=".*"
}
