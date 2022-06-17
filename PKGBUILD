# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=fast-translate
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="一款适用于Linux系统的翻译软件，支持选中即翻译，方便文献阅读等"
arch=('x86_64')
url="https://github.com/KaleW515/fast-translate"
license=('MIT')
groups=(fast-translate)
depends=(make python python-pip)
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
source=("https://github.com/kalew515/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
md5sums=('b1f7635b4a3e3ff3fe023040a0505f1b')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make check-dependency
}

check() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make install
}
 
