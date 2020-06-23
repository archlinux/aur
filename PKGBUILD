# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=rofi-zeal-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Search code documentation from rofi"
arch=(x86_64 i686)
url="https://github.com/Zeioth/rofi-zeal.git"
license=('MIT')
groups=()
depends=()
makedepends=(git rofi zeal)
checkdepends=()
optdepends=()
provides=(rofi-zeal)
conflicts=(rofi-zeal)
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
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p ~/.local/share/rofi/rofi-zeal/
	  cp "${srcdir}/rofi-zeal/rofi-zeal.sh" "/home/zeioth/.local/share/rofi/rofi-zeal/rofi-zeal.sh"
}
