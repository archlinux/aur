# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
_pkgcore=feedback
pkgname=feedback-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Open-source platform for rhythm gaming and music education"
arch=('x86_64')
url="https://got-feedback.org/"
license=('AGPL-3.0-or-later')
depends=(
	'alsa-lib'
	'at-spi2-core'
	'bash'
	'cairo'
	'dbus'
	'expat'
	'fontconfig'
	'freetype2'
	'glib2'
	'glibc'
	'gtk3'
	'hicolor-icon-theme'
	'libcups'
	'libgcc'
	'libglvnd'
	'libstdc++'
	'libudev'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxcrypt-compat'
	'libxcursor'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'zlib'
)
source=("https://github.com/got-feedBack/feedBack-desktop/releases/download/v${pkgver}-alpha.1/${_pkgcore}-${pkgver}-amd64.deb")
sha256sums=('b30f3c632734d4fb194ceb0fe4a5471d6ab4e965eede1b58a60dda9dbaa89a64')

package() {
	tar -xJf data.tar.xz --no-same-owner -C "${pkgdir}"
}
