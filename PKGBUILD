# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="getoptions"
pkgname="${_pkgname}"
pkgdesc="An elegant option/argument parser for shell scripts "
pkgver="3.3.0"
pkgrel="2"

arch=('any')
url="https://github.com/ko1nksm/getoptions"
license=('CC0-1.0')
conflicts=("${_pkgname}-git")

source=("${url}/archive/refs/tags/v${pkgver}.zip")
md5sums=('SKIP')

_dir="getoptions-${pkgver}"

build(){
    cd "${srcdir}/${_dir}"
    make
}

package() {
    cd "${srcdir}/${_dir}"
    make install PREFIX="${pkgdir}/usr/"
}
