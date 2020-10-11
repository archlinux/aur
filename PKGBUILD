
# Maintainer : abdus <nail@abdus.xyz>

pkgname=2048.c
pkgver=108
pkgrel=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
source=("https://raw.githubusercontent.com/mevdschee/2048.c/9b387c3071d962a1c923f66b5caa3f849d519a0c/2048.c"
        "https://raw.githubusercontent.com/mevdschee/2048.c/9b387c3071d962a1c923f66b5caa3f849d519a0c/Makefile")
md5sums=('4d7e729490b577df6d22a0959a7423c4'
         '23bf7679190d5f35fcd9d26b67c42e70')

build() {
    cd "${srcdir}"
    make
}

check() {
    cd "${srcdir}"
    ./2048 test
}

package() {
    install "${srcdir}/2048" -D "${pkgdir}/usr/bin/2048"
}

