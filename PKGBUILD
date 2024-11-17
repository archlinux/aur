# Maintainer: SplatDem

pkgname=sn
pkgver=0.1.0
pkgrel=1
pkgdesc="Splat Notes -- simple utility for notes"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=('git+https://github.com/SplatDem/sn.git')
md5sums=('SKIP')

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	cargo install --path . --root "$pkgdir/usr"
}
