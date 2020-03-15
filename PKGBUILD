# Maintainer: James Armstrong <jm.armstrong1207@gmail.com>
pkgname=detect-tablet-mode-git
pkgver=master
pkgrel=1
pkgdesc="Detects both normal & tablet mode, executing custom scripts/commands for each mode. See the github page for instructions."
arch=('any')
url=""
license=('GPL')
groups=()
depends=('ruby' 'libinput')
makedepends=('git')
optdepends=()
provides=('libinput')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/alesguzik/linux_detect_tablet_mode")
noextract=()
sha256sums=('SKIP')
#build() {
#}

package() {
	cd $pkgname

	install -d $pkgdir/usr/bin
	install -d $pkdir/home/$USER/.config/

	cp watch_tablet $pkgdir/usr/bin
	cp watch_tablet.yml $pkdir/home/$USER/.config
}
