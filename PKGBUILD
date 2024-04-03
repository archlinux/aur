#Maintainer: VPeti1 (Vasko Peter) 

pkgname=ddostool
pkgver=1
pkgrel=1
arch=('x86_64')

pkgdesc="A simple DDossing utility made in python"
license=('LGPL3')

depends=('gcc' 'python3')

source=("https://github.com/VPeti1/CWAcces/raw/main/ddostool.tar.gz")

sha256sums=('9f857e32a22f95d9096a2513270e058e7d5f16469257c5d4ec7dd60482cb09d1')

build() {
    sudo rm -rf /usr/ddostool
    sudo mkdir /usr/ddostool
    cd "$srcdir"
    sudo cp main.py /usr/ddostool
    g++ -o ddostool run.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 ddostool "$pkgdir/usr/bin/ddostool"
}


