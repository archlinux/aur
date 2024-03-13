# Maintainer: Hyp3r <hyp3r@rhokz.com>
pkgname=skip
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="skip is a command-line tool used to skip lines in output"
arch=('x86_64' 'i686')
url="https://github.com/clintwebb/skip"
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
source=("https://github.com/clintwebb/skip/archive/refs/tags/v0.0.4.tar.gz")
noextract=()
sha256sums=('845b32c2a6575dd80e625ed5a37dfd0de9ef2637bdb1c49daf38ecd1e07afcaf')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="${pkgdir}/"
}
