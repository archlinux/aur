# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=etl
pkgname=etlcpp
pkgver=20.23.0
pkgrel=1
pkgdesc="Embedded Template Library"
arch=('x86_64')
url="https://www.etlcpp.com/"
license=('MIT')
makedepends=()
checkdepends=()
source=("https://github.com/ETLCPP/etl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('960ed17544627f6cdac42c9c636f96389fe6d5948d729b79be4c592fe5805d4b')

prepare() {
    :
}

build() {
    :
}

package() {
    mkdir -p "${pkgdir}/usr/include"
    cp -r "${_pkgname}-${pkgver}/include" "${pkgdir}/usr/."
    rm -rf "${pkgdir}/usr/include/etl/.vscode"

    install -D -m644 \
        "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

