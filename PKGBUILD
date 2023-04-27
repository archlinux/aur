# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=chatbox-bin
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
groups=()
depends=('webkit2gtk' 'gtk3' 'openssl-1.1'
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
source=("https://github.com/Bin-Huang/chatbox/releases/download/Chatbox-v${pkgver}/chatbox_${pkgver}_amd64.deb")
noextract=()
sha256sums=('fc48ff2904e66c6a2f5cf09d590d15c8b4ac5944d6fa84f53874e00a04eade89')
validpgpkeys=()

package() {
    tar -xvpf data.tar.gz -C $pkgdir
    chown root:root -R $pkgdir
} 
