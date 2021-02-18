# Maintainer: Scott Little <swlittle7 [at] gmail.com>
pkgname="uniclip"
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="Universal Clipboard, ala Apple"
arch=(x86_64)
url="https://github.com/quackduck/uniclip"
license=('MIT')
groups=()
depends=()
makedepends=("go")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/quackduck/uniclip/archive/v2.1.0.tar.gz")
noextract=()
sha256sums=("bb22ebc9dd9e0ca8e8b6b8c79c5d0af05a61cf2b86fff75916b2722760b04cce")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	go build
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"/usr/local/bin
	cp uniclip "$pkgdir"/usr/local/bin
}
