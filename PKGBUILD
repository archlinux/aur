#Maintainer: VPeti1 (Vasko Peter) 

pkgname=eaur
pkgver=2
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple AUR downloader made in C++"

depends=('gcc' 'git' 'base-devel')

source=("https://github.com/VPeti1/CWAcces/raw/main/easyaur.tar.gz")

sha256sums=('7392fc78d6cbc769a65fea51dc7a10b7c023a9d14538418ec7d60ef9871ca5b1')

build() {
    cd "$srcdir"
    g++ -o easyaur main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 easyaur "$pkgdir/usr/bin/eaur"
}


