# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ARKANYOTA <arkanyota@icloud.com>
pkgname=bitedit
pkgver=0.9.4
pkgrel=1
epoch=
pkgdesc="useful for directly editing existing bitmap font files, like Linux psf console fonts"
arch=("x86_64")
url="https://www.ledge.co.za/software/bitedit/bitedit.tar.gz"
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
source=("$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make all
}

package() {
	cd "$pkgname-$pkgver"
	sudo make DESTDIR="$pkgdir/" install

}
