# Maintainer: Robert Clarke <arch@robertclarke.co.uk>
# Contributor: Robert Clarke
pkgname=corluma-bin
pkgver=0.28
pkgrel=1
pkgdesc="App to control Philips Hues, Nanoleaf products, and Arduinos running ArduCor."
arch=('i686' 'x86_64')
url="https://www.corluma.net/linux"
license=('custom')
groups=('')
depends=('dbus' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'harfbuzz' 'libdrm' 'libglvnd' 'libice' 'libjpeg-turbo' 'libpng' 'libsm' 'libtiff' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'pcre2' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib')
options=('!strip' '!emptydirs')
source_i686=("https://www.dropbox.com/s/zragmonc1h19952/corluma_0.28-05.deb?dl=1")
source_x86_64=("https://www.dropbox.com/s/zragmonc1h19952/corluma_0.28-05.deb?dl=1")
sha512sums_i686=('4d4e60eb7b370f87a7f30c2f105b524b8093439b72229abc7920ab4ee8e2b07c14d96111be91bc245cf88b3c21432c2310bd8fb52c4c6400185a65bad815dc20')
sha512sums_x86_64=('4d4e60eb7b370f87a7f30c2f105b524b8093439b72229abc7920ab4ee8e2b07c14d96111be91bc245cf88b3c21432c2310bd8fb52c4c6400185a65bad815dc20')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
