#Maintainer: VPeti1 (Vasko Peter) 

pkgname=rerepm
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="All in one package manager for linux"

depends=('gcc')

source=("https://github.com/VPeti1/CWAcces/raw/main/rerepm.tar.gz")

sha256sums=('e0165e6088a820386832a899895b0516116d072ec39725771835d69f72173969')

build() {
    cd "$srcdir"
    g++ -o aiopm main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 aiopm "$pkgdir/usr/bin/rerepm"
}


