
# Maintainer: 4or0

pkgname=orphanhunter

pkgver=1.0.0

pkgrel=1

pkgdesc="A tool to find orphan packages based on binary access time (atime)"

arch=('x86_64')

url="https://github.com/ggxerus/orphanhunter"

license=('MIT')

depends=('gcc-libs')

makedepends=('gcc')

source=("https://raw.githubusercontent.com/ggxerus/orphanhunter/main/orphanhunter.c")

sha256sums=('6f701d2322a596cb7cd227ba09c0f1c3343370f9d5944ba054db310acd40303e')


build() {

    g++ "$srcdir/orphanhunter.c" -o orphanhunter $CXXFLAGS $LDFLAGS

}


package() {

    install -Dm755 orphanhunter "$pkgdir/usr/bin/orphanhunter"

}

