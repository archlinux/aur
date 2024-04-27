#Maintainer: VPeti1 (Vasko Peter) 

pkgname=flexpkg
pkgver=8
pkgrel=3
arch=('x86_64')

pkgdesc="A new to install programs"
license=('GPL3')

depends=('gcc' 'git' 'python3')

source=("https://github.com/VPeti1/CWAcces/raw/main/flexpkg.tar.gz")

sha256sums=('55fb4a7f45f0da603becf2987b418745ca598908c1859a98c4d6910642677e8f')

build() {
    cd "$srcdir"
    g++ -o flexpkg installer.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 flexpkg "$pkgdir/usr/bin/flex"
}


