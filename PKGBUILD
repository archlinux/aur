# Maintainer: Your Name <youremail@domain.com>
pkgname=hyprwindow
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A minimal application/workspace switcher for Hyprland."
arch=('x86_64')
url="https://github.com/44David/hyprwindow"
license=('MIT')
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
source=("https://github.com/44David/hyprwindow/releases/download/v1.0/hyprwindow-1.0-x86_64.tar.gz")
noextract=()
sha256sums=('77642492fe653d3b575b889132dc21eba21a8d4f6be6b26ab6be56b0294f557f')
validpgpkeys=()


package() {
	cd "$srcdir"
	install -Dm755 "hyprwindow" "$pkgdir/usr/bin/hyprwindow"
}
