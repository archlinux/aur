# Maintainer: SplatDem

pkgname=scic
pkgver=0.1.0
pkgrel=1
pkgdesc="SplatCheck Internet Connection -- utility for check your internet speed"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=('git+https://github.com/SplatDem/scic.git')
md5sums=('SKIP')

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	cargo install --path . --root "$pkgdir/usr"
}
