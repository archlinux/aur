# Maintainer: Pietro <yexmaintainer@protonmail.com>
pkgname=yex-git
pkgver=0.1.r128.6a6648a
pkgrel=1
pkgdesc="Yex programming language created by nonamescm"
arch=(x86_64)
url="https://github.com/yex-lang/yex-lang"
license=('MIT')
depends=()
makedepends=(git rust)
checkdepends=()
optdepends=()
provides=(yex)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "yex-lang"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "yex-lang"
	cargo install --path yex --force
}


package() {
	echo "add ~/.cargo/bin into your path in order to run yex" 
}
