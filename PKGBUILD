# Maintainer: Scott Little <swlittle7 [at] gmail.com>
pkgname=uniclip
pkgver=2.2.0
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
source=("https://github.com/quackduck/uniclip/archive/v2.2.0.tar.gz")
noextract=()
sha256sums=("47a767e8eff0f8681534de861c8471f33eacab5ccdc066bffb712752155a0d56")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"/usr/local/bin
	cp uniclip "$pkgdir"/usr/local/bin
}
