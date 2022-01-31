# Maintainer: Timothy Newton <timothynewton1998@gmail.com>
pkgname=auto-rotation-hdaps-git
pkgver=1.1
pkgrel=1
pkgdesc="This application adds auto-rotation functionality to tablet/laptop devices with Linux that have HDAPS accelerometers such as the X201 tablet Thinkpad."
arch=("any")
url="https://github.com/Unicornasaurous/auto_rotation_hdaps.git"
license=()
groups=()
depends=("libinput" "hdapsd" "python")
makedepends=("git")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("$pkgname::git+$url")
noextract=()
sha256sums=("SKIP")


package() {
	cd $pkgname

	install -d $pkgdir/usr/bin

	cp auto_rotate.py $pkgdir/usr/bin
	cp tablet_mode_detection.py $pkgdir/usr/bin
}
