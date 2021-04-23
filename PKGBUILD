
# Contributor : abdus <nail@abdus.xyz>
# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>

pkgname=2048.c
pkgver=108
pkgrel=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
source=("https://raw.githubusercontent.com/mevdschee/2048.c/bdb7527db2c4b5ce5eb8b8067ed9c0330ead77ea/2048.c"
        "https://raw.githubusercontent.com/mevdschee/2048.c/bdb7527db2c4b5ce5eb8b8067ed9c0330ead77ea/Makefile")
md5sums=('4d7e729490b577df6d22a0959a7423c4'
         '006de8d5fdd80f801619f1b4c98654e5')

build() {
    cd "${srcdir}"
    make
}

check() {
    make test 
}

package() {
      make DESTDIR="$pkgdir/" install
}

