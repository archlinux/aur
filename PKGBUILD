# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=fcct_test_do_not_use
pkgver=0.3.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=("any")
url="https://github.com/coreos/fcct"
license=("Apache")
makedepends=("git" "go" "make")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    ./build
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
