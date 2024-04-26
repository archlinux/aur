#Maintainer: VPeti1 (Vasko Peter) 

pkgname=repm
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="All in one package manager for linux"

depends=('gcc')

source=("https://github.com/VPeti1/CWAcces/raw/main/repm.tar.gz")

sha256sums=('6c77bf01a7c9737366aeb51528033efa7b5ea94be9ed37381ae4fb4564b3eae1')

build() {
    cd "$srcdir"
    g++ -o aiopm main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 aiopm "$pkgdir/usr/bin/repm"
}


