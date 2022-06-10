# Maintainer: Thomas 'Eternahl' ROLLIN
pkgname=cwonf
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Synchronize your configurations files with a common context"
arch=(x86_64)
url="https://codeberg.org/Eternahl/cwonf"
license=('MIT')
groups=()
depends=()
makedepends=(rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz"::$url/archive/$pkgver.tar.gz)
noextract=()
md5sums=("352877690d7cc825a2678751ecd4b6fd")
validpgpkeys=()

build() {
	cd "$pkgname"
	cargo build --release
}

check() {
	cd "$pkgname"
	cargo test
}

package() {
	cd "$pkgname"
	cargo install --path $pkgdir
}
