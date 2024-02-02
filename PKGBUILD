# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=unshell-git
pkgver=0.9.0
pkgrel=1
pkgdesc="A utility for splitting input into shell-like tokens"
url="https://codeberg.org/coralpink/unshell"
source=("$pkgname-$pkgver::git+https://codeberg.org/coralpink/unshell.git#tag=$pkgver")
arch=("any")
license=("custom:MIT+NIGGER")
md5sums=("SKIP")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr PACKAGE_NAME="$pkgname" install
}
