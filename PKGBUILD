# Maintainer: Glitt3ring
pkgname=blockdodger
pkgver=2.0
pkgrel=5
epoch=
pkgdesc="Block Dodging game Made by Glitt3ring."
arch=(x86_64 i386)
url="https://www.github.com/glitt3ring/blockdodger.git"
license=()
groups=()
depends=(alsa-lib alsa-utils make pipewire pipewire-alsa pipewire-audio pipewire-pulse python python-pygame sudo wireplumber)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("git+$url")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

package() {
	cd "blockdodger"
	make install
}
