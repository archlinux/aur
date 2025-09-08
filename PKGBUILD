# Maintainer: Jacob Aulin <jacob.aulin@proton.me>
pkgname='qvickbuild'
pkgver=v0.8.0
pkgrel=3
pkgdesc="A simple, lightweight, and fast build system for C, C++, and more"
arch=('x86_64')
url="https://gitlab.com/nordtektiger/qvickbuild"
license=('MIT')
depends=()
makedepends=('make' 'clang' 'git')
source=("git+https://github.com/nordtektiger/qvickbuild.git#tag=$pkgver")
sha256sums=('SKIP')
# validpgpkeys=()

build() {
	cd "$srcdir/qvickbuild"
	make
}

package() {
	cd "$srcdir/qvickbuild"
  install -Dm 755 "./bin/quickbuild" "$pkgdir/usr/bin/qvickbuild"
}
