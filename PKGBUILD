#Maintainer: VPeti1 (Vasko Peter) 

pkgname=eaur
pkgver=4
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple AUR downloader made in C++"

depends=('gcc' 'git' 'base-devel')

source=("https://github.com/VPeti1/CWAcces/raw/main/easyaur.tar.gz")

sha256sums=('6f4dc630edfe4b046d1b37442b360c58efee73fd186de38b20652a26b152449e')

build() {
    cd "$srcdir"
    g++ -o easyaur main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 easyaur "$pkgdir/usr/bin/eaur"
}


