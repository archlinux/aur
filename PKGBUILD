# Maintainer: Aaron Esau <contact@aaronesau.com>
pkgname="heaptrace"
pkgver="2.0"
pkgrel="1"
license=("BSD")
arch=("x86_64")
md5sums=("SKIP")
url="https://github.com/Arinerron/heaptrace"
pkgdesc="a tool for tracking heap operations"
source=("${pkgname}-${pkgver}::git+https://github.com/Arinerron/heaptrace.git#branch=main")
makedepends=("gcc")

prepare() {
    # pre_build

    cd "${srcdir}/${pkgname}-${pkgver}"
    
}

build() {
    # build

    cd "${srcdir}/${pkgname}-${pkgver}"
    ./compile.sh
}

check() {
    # post_build

    cd "${srcdir}/${pkgname}-${pkgver}"
    
}

package() {
    # copy files over and change perms
    install -D "${srcdir}/${pkgname}-${pkgver}/heaptrace" "${pkgdir}//usr/bin/heaptrace" --mode=755 --owner="root" --group="root"
}
