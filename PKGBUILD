# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=aurago-git
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="Aura is a replacement for wget and curl to fetch online content from terminal"
arch=(x86_64 i686)
url="https://github.com/arghyagod-coder/aurago.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
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
    printf "1.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd aurago
	bash linux/full_install.sh

}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	echo "Installation DOne"
}
