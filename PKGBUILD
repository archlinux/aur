# Maintainer: Alastair Pharo <me at asp dot dev>
pkgname=archlinux-nix
pkgver=1.1.1
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
sha256sums=('cc3a3e1f0824eb398b96d1d6da0dc741eafc47f73659b86ed6cff9c7a0f7649b')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
