# Maintainer: Your Name <youremail@domain.com>
pkgname=passrack
pkgver=1.6
pkgrel=1
epoch=
pkgdesc="A simple CLI for managing passwords."
arch=(x86_64 i686)
url="https://github.com/AvanindraC/PMCLI.git"
license=('MIT')
groups=()
depends=(python3 python-pip)
makedepends=(git python3 python-pip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "${_pkgname}"
    printf "1.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	pip install passrack
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	echo "Installation DOne"
}
