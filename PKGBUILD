# Maintainer: Cedric Brancourt <cedric.brancourt@gmail.com>

pkgname=adapta-nord-git
_pkgname=AdaptaNord
pkgver=r46.245822f
pkgrel=1
pkgdesc="Nord version of Adapta Colorpack!"
arch=("any")
url="https://github.com/Joshaby/Adapta-Nord.git"
license=('GPL')
makedepends=()
optdepends=()
source=("${_pkgname}::git+https://github.com/Joshaby/Adapta-Nord.git")
sha256sums=('SKIP')

pkgver() {
  	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  	cd "${srcdir}/${_pkgname}"
}

package() {
  	cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/themes/"
	cp -a "${srcdir}/${_pkgname}/Pkg/usr/share/themes/"* "${pkgdir}/usr/share/themes/"
}