# Maintainer: Glitt3ring
pkgname=blockdodger
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Block Dodging game Made by Glitt3ring."
arch=(x86_64 i386)
url="https://www.github.com/glitt3ring/blockdodger.git"
license=('GPL')
groups=()
depends=(alsa-lib alsa-utils pipewire pipewire-alsa pipewire-audio pipewire-pulse python python-pygame sudo wireplumber)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

package() {
	cd "blockdodger"
	chmod +x install.sh
	sh install.sh
}
