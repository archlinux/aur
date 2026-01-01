# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
depends=(
	# hyper8-core dependencies
	'ffmpeg'
	'rsync'
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
pkgver=1.0.1
sha256sums_x86_64=('97d3ab6853fd8fc458804a465f6cd86157a8a47a2292d8ced9371d0dee0a0f81')
url='https://simonrepp.com/hyper8'

source_x86_64=("https://simonrepp.com/hyper8/packages/hyper8_${pkgver}-1+deb12_amd64.deb")

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
}
