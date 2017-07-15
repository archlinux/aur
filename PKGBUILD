# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=mcm
_pkgname=mcm
pkgver=0.83
pkgrel=2
pkgdesc="MCM file compressor"
arch=('x86_64')
url="https://github.com/mathieuchartier/mcm"
license=('GPL3')
makedepends=('git')
source=("git+https://github.com/mathieuchartier/mcm.git#branch=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    ./make.sh
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/mcm" "${pkgdir}/usr/bin/mcm"
}
