# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.1.2
pkgrel=5
_pkgrel=7
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
conflicts=('kotatogram-desktop' 'kotatogram-desktop-bin' 'telegram-desktop' 'telegram-desktop-bin')
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz")
sha512sums=('23fca78727e055cef16da66762ed1184916d744132ca5377df6d512b1fe41222ac3085b6726e48f38d78eda543f8dc7ff09660dfc4447af4d1485e80984ab23e')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz" -C "$pkgdir" --exclude=".*"
}
