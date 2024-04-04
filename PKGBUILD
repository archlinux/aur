#Maintainer: VPeti1 (Vasko Peter) 

pkgname=eaur
pkgver=3
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple AUR downloader made in C++"

depends=('gcc' 'git' 'base-devel')

source=("https://github.com/VPeti1/CWAcces/raw/main/easyaur.tar.gz")

sha256sums=('51fcc8800b49b0e80a0e4df17cd3b80a6b611b1b0c4575abb873f7816dffbc26')

build() {
    cd "$srcdir"
    g++ -o easyaur main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 easyaur "$pkgdir/usr/bin/eaur"
}


