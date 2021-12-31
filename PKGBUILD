# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=etl
pkgname=etlcpp
pkgver=20.22.0
pkgrel=1
pkgdesc="Embedded Template Library"
arch=('x86_64')
url="https://www.etlcpp.com/"
license=('MIT')
makedepends=()
checkdepends=()
source=("https://github.com/ETLCPP/etl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1b80a3f4af1010810826e09a18c7bbd9df2eb93e5fc413c853af7caa4ee9d2ec')

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

