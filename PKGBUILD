# Maintainer: Alastair Pharo <me at asp dot dev>
pkgname=archlinux-nix
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A command-line tool for setting up Nix on Arch Linux"
arch=('any')
url="https://github.com/asppsa/archlinux-nix"
license=('Apache')
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
source=("https://github.com/asppsa/archlinux-nix/archive/v1.0.0.tar.gz")
noextract=()
sha256sums=("936d0751ded357d8204d9e4ed068e3c85eb4617ee7611398365fd1fd60ae85b4")
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
