# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
depends=(
	# hyper8-core dependencies
	'ffmpeg'
	# hyper8-desktop dependencies
	'cairo'
	'desktop-file-utils'
	'gdk-pixbuf2'
	'glib2'
	'gtk3'
	'hicolor-icon-theme'
	'libsoup'
	'pango'
	'webkit2gtk-4.1'
)
install=hyper8-bin.install
license=('AGPL3')
options=('!lto')
pkgdesc='A static site generator for video publishing'
pkgname=hyper8-bin
pkgrel=1
pkgver=1.1.0
sha256sums_x86_64=('b633a7b92f757966ba3493baae068167de14024168274e6f6b900102ad09c880')
url='https://hyper8.org'

source_x86_64=("https://hyper8.org/packages/hyper8_${pkgver}-1+deb12_amd64.deb")

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
}
