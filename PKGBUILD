# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="getoptions"
pkgname="${_pkgname}-git"
pkgdesc="An elegant option/argument parser for shell scripts (git version)"
pkgver="3.3.0"
pkgrel="1"

arch=('any')
url="https://github.com/ko1nksm/getoptions"
license=('CC0-1.0')
conflicts=("${_pkgname}")

source=("git+${url}.git")
md5sums=('SKIP')

_dir="getoptions"

build(){
    cd "${srcdir}/${_dir}"
    make
}

package() {
    cd "${srcdir}/${_dir}"
    make install PREFIX="${pkgdir}/usr/bin/"
}
