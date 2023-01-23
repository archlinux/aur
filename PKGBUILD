# Maintainer: Robert Clarke <arch@robertclarke.co.uk>
# Contributor: Robert Clarke
pkgname=corluma-bin
pkgver=0.30
pkgrel=1
pkgdesc="App to control Philip's Hues, Nanoleaf products, and Arduinos running ArduCor."
arch=('i686' 'x86_64')
url="https://www.corluma.net/linux"
license=('')
groups=('')
depends=('dbus' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'libglvnd' 'libice' 'libsm' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'pcre2' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm')
options=('!strip' '!emptydirs')
source_x86_64=("https://www.dropbox.com/s/ygv7kvu7bqsk943/corluma_0.30-09.deb?dl=1")
sha512sums_x86_64=('f1ebdca63ff32f1e50655518c80d35b727478f958745944acb1882bf068f6f37f813306bb54372136360ff2bd0557d0a7b12177ac2e4aedb1fcfdd4ebbc30451')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
