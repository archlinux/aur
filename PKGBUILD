# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: Dashiell <dashiellzonena@gmail.com>
pkgname=gwmct
pkgver=1.1
pkgrel=1.0
epoch=
pkgdesc="A simple terminal for Wayland"
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
sha256sums=(2c9f4848ff1bd7f9a8d6c0086c8a3ad1d7831ead4717b7a6d9335574373e4eab)
validpgpkeys=()
package() {
	cd "$HOME/$pkgname/src/$pkgname/"
	make DESTDIR="$destdir/" build install
}
