# Maintainer: Pedro P. <pvṕscŕipt [at] gmàil -rmthis- [døt] c0m>
pkgname=lspac
pkgver=1.0.0
pkgrel=1
epoch=0
pkgdesc="Display package informations in a parse friendly fashion"
arch=('x86_64')
url="https://github.com/pvpscript/lspac"
license=('GPL3')
groups=()
depends=('pacman')
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
source=("https://github.com/pvpscript/lspac/raw/main/versions/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('c7de3de6a05a1c191c3d3e04c50decb6')
sha256sums=('8b68a57a54c4b255890d42eb67d175f3ad3f38c940e9beae13cbeb0f9a8b5401')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
