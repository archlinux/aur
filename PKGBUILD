#Maintainer: VPeti1 (Vasko Peter) 

pkgname=opencw
pkgver=1.3
pkgrel=1
arch=('x86_64')

license=('GPL2')
pkgdesc="The linux port of CW-I"

depends=('gcc' 'flatpak' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/opencw.tar.gz")

sha256sums=('ae922b74ee80cbb6319aa8aaf8db7d62ba41cb3b5b47e7319d9fef36619b7409')

build() {
    cd "$srcdir"
    g++ -o opencw main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 opencw "$pkgdir/usr/bin/opencw"
}


