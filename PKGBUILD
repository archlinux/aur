# Maintainer: Alastair Pharo <me at asp dot dev>
pkgname=archlinux-nix
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A command-line tool for setting up Nix on Arch Linux"
arch=('any')
url="https://github.com/asppsa/archlinux-nix"
license=('Apache')
groups=()
depends=('xz')
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
sha256sums=('63b9dc8997cab8d9c4a9d8bcb9009e7af3056605af56a2193548dbd59f817db4')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
