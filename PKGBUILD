
# Maintainer : mdevlamynck <matthias.devlamynck@mailoo.org>

pkgname=2048.c
pkgver=107
pkgrel=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
source=("https://raw.githubusercontent.com/mevdschee/2048.c/83b3d53f4739fefe138a4cb8090959b6e045586d/2048.c"
        "https://raw.githubusercontent.com/mevdschee/2048.c/83b3d53f4739fefe138a4cb8090959b6e045586d/Makefile")
md5sums=('b13e62bac86203620b609b275bc52e5e'
         'd53ad3be6bb1c30be267bfa9ae7185f0')

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

