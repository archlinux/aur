# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=chatbox-bin
pkgver=0.4.5
pkgrel=1
epoch=
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://chatboxapp.xyz"
license=('GPL')
groups=()
depends=('webkit2gtk' 'gtk3' 'openssl-1.1'
	cairo pango
	glib2 gcc-libs hicolor-icon-theme
	glibc gdk-pixbuf2)
makedepends=()
checkdepends=()
optdepends=()
provides=(chatbox)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/chatbox_${pkgver}_amd64.deb")
noextract=()
sha256sums=('14be20af141b80bf7dda12e50c455f73077ff26cb6b70ca8517056cc2ed4b3e6')
validpgpkeys=()

package() {
	tar -xvpf data.tar.gz -C $pkgdir
	chown root:root -R $pkgdir
}
