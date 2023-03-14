# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=chatbox-bin
pkgver=0.0.9
pkgrel=1
epoch=
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
groups=()
depends=(gtk3)
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
source=("https://github.com/Bin-Huang/chatbox/releases/download/v${pkgver}/chatbox_${pkgver}_amd64.deb")
noextract=()
sha256sums=('4d0b2f23c3ae2cd753438df0ef58a83e27cad85317aebb8650797320f45ce795')
validpgpkeys=()

package() {
    tar xvpf data.tar.xz -C $pkgdir
}
