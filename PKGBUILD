#Maintainer: VPeti1 (Vasko Peter) 

pkgname=eaur
pkgver=4.2
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple AUR downloader made in C++"

depends=('gcc' 'git' 'base-devel')

source=("https://github.com/VPeti1/CWAcces/raw/main/easyaur.tar.gz")

sha256sums=('724ecf72e4c21a6bb0f42f9e9e9bbcd2e029f1410843423659b6488fe8b568c6')

build() {
    cd "$srcdir"
    g++ -o easyaur main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 easyaur "$pkgdir/usr/bin/eaur"
}


