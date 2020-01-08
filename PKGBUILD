# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>

pkgname=kotatogram-desktop-dynamic-bin
_pkgname=kotatogram-desktop
pkgver=1.1.2
pkgrel=2
_pkgrel=4
pkgdesc="Unofficial desktop client for the Telegram messenger, based on Telegram Desktop - Precompiled package"
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
source=("https://github.com/ilya-fedin/kotatogramAUR/releases/download/k${pkgver}-4/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz")
sha512sums=('54a85b15960cfdc606fb35c72609fbb3bcddaac7f5df3783cdc4e0ec1c919976499eed822b474fe0a5de9286414f9ecae49f47f9cc2a709754b6fc6ed792dec9')

package() {
	tar -xaf "$srcdir/${_pkgname}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz" -C "$pkgdir" --exclude=".*"
}
