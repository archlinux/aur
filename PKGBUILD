# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkgname=gwmct
pkgver=1.2
pkgrel=1.0
epoch=
pkgdesc="A simple terminal for Wayland(And X)"
arch=('x86_64')
url="https://github.com/0xEcoder/gwmct"
license=('GPL3')
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
source=("$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=(f7e78c947454e384f211c271e36d9d0192b1c0e3c0d43117f1116824e6710e40)
validpgpkeys=()
package() {
	mkdir -p "$HOME/$pkgname/src"
	tar xf "$HOME/$pkgname/gwmct-1.2.tar.gz" "$HOME/$pkgname/src"
	cd "$HOME/$pkgname/src/$pkgname/"
	make DESTDIR="$destdir/" build install
}
