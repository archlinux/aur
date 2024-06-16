# Maintainer: Raphael Tittel <raphaeltittel@gmail.com>
pkgname=pw-volume-gui
pkgver=1.00
pkgrel=1
epoch=
pkgdesc="A graphical pipewire volume control built on smasher164's pw-volume"
arch=(x86_64)
url="https://github.com/Raphadoodle/pw-volume-gui.git"
license=('GPL')
groups=()
depends=(python3 tk ttf-nerd-fonts-symbols pipewire wireplumber pw-volume)
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
sha256sums=('SKIP')
validpgpkeys=()


package() {
	cd "$pkgname"
	install -Dm755 main.py ${pkgdir}/usr/bin/pw-volume-gui
	install -Dm644 README.md ${pkgdir}/usr/share/pw-volume-gui/README.md
	install -Dm644 COPYING ${pkgdir}/usr/share/pw-volume-gui/COPYING
}
