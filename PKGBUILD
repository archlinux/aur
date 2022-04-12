# Maintainer: Kedap <kedap dot dev at protonmail dot com>
pkgname=toml-fmt
pkgver=0.1.0
pkgrel=1
pkgdesc="Format .toml files"
arch=('any')
url="https://github.com/segeljakt/toml-fmt"
license=('MIT')
depends=()
source=("git+https://github.com/segeljakt/${pkgname}.git")
md5sums=('SKIP')

build() {
	cd "$pkgname"
        cargo build --release
}

package() {
	cd "$pkgname"
        install -Dm 755 "target/release/$pkgname" "$pkgdir"/usr/bin/$pkgname
}
