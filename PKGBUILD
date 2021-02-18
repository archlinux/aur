# Maintainer: Scott Little swlittle7 [at] gmail [dot] com
pkgname=nat
pkgver=2.1.11
pkgrel=1
epoch=
pkgdesc="The Better ls"
arch=(x86_64)
url="https://github.com/willdoescode/nat"
license=('MIT')
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/willdoescode/nat/archive/v2.1.11.tar.gz")
noextract=()
sha256sums=("23cf03b63c2815eca433df8b79cf758b19804ab1d69e46c8a4a877f71590ded6")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	cargo install --path .
}
