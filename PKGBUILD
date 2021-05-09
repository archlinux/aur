# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=etl
pkgname=etlcpp
pkgver=20.10.1
pkgrel=1
pkgdesc="Embedded Template Library"
arch=('x86_64')
url="https://www.etlcpp.com/"
license=('MIT')
makedepends=()
checkdepends=()
source=("https://github.com/ETLCPP/etl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca07b027d07fff4b83e724cc630fbdadc3a2dfd4696a8da488265aab921e7ba6')

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

