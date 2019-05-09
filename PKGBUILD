# Maintainer: Alastair Pharo <me at asp dot dev>
pkgname=archlinux-nix
pkgver=1.1.0
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
sha256sums=('570c3db0a26ff73142127e9f4698f0f742f5b62f1076c4b2731783495df89edb')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
