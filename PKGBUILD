# Maintainer: Glitt3ring
pkgname=gui-cli-toggle
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A script to toggle between multi-user and graphical targets"
arch=(any)
url="https://www.github.com/glitt3ring/gui-cli-toggle.git"
license=('unknown')
groups=()
depends=(sudo systemd bash make)
makedepends=()
checkdepends=()
optdepends=(
    'gdm: GNOME Display Manager'
    'sddm: KDE Display Manager'
    'lightdm: Lightweight Display Manager'
    'lxdm: LXDE Display Manager'
    'xdm: X Display Manager'
    'ly: TUI Display Manager'
)
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
	cd "gui-cli-toggle"
	make install
}
