# Maintainer: Your Name <youremail@domain.com>
pkgname=hydra-go
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="hydra is a command line utility for generating language-specific project structures."
arch=(x86_64 i686)
url="https://github.com/Shravan-1908/hydra.git"
license=('MIT')
groups=()
depends=()
makedepends=(git curl)
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
    printf "2.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd hydra
	bash linux_install.sh

}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	echo "Installation DOne"
}
