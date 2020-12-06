# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Abhishek Zambare <abhishekzambare@gmail.com>
pkgname=macos-3d-originals-theme
pkgver=2.6
pkgrel=1
epoch=
pkgdesc="MacOS-3D-Originals is a Gtk3 theme created using the awesome Orchis theme"
arch=(x86_64)
url="https://github.com/Macintosh98/MacOS-3D.git"
license=('GPL')
groups=()
depends=()
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
md5sums=('SKIP')
validpgpkeys=()


package() {
	cd MacOS-3D
	cp -r MacOS-3D-Gtk-dark-compact ~/.themes
	cp -r MacOS-3D-Gtk-dark ~/.themes
	cp -r MacOS-3D-Gtk-light-compact ~/.themes
	cp -r MacOS-3D-Gtk-light ~/.themes
	
	cp -r Gnome-Shell/MacOS-3D-Shell-dark-compact ~/.themes
	cp -r Gnome-Shell/MacOS-3D-Shell-dark ~/.themes
	cp -r Gnome-Shell/MacOS-3D-Shell-light-compact ~/.themes
	cp -r Gnome-Shell/MacOS-3D-Shell-light ~/.themes
}
