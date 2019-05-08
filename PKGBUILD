# Maintainer: Alastair Pharo <me at asp dot dev>
pkgname=archlinux-nix
pkgver=1.0.1
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
source=("https://github.com/asppsa/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('51583c9d0b3d1ac7139d890d7a8b53ba124263fef95ee7b78022162c0931aa38')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
