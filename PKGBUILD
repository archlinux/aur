# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=chatbox-bin
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://github.com/Bin-Huang/chatbox"
license=('GPL')
groups=()
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')
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
sha256sums=('b1c49f526ef2849bff9042f05b0a9d1b1e32fde2b14db4e6ba0037a8aa65d1d7')
validpgpkeys=()

package() {
    tar -xvpf data.tar.gz -C $pkgdir
} 
