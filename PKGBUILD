#Maintainer: VPeti1 (Vasko Peter) 

pkgname=eaur
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple AUR downloader made in C++"

depends=('gcc' 'git' 'base-devel')

source=("https://github.com/VPeti1/CWAcces/raw/main/easyaur.tar.gz")

sha256sums=('786d6cbec666b0f4f006b95fb981b85eb4ba7b0ddbcf23218c5a266f0b6eab67')

build() {
    cd "$srcdir"
    g++ -o easyaur main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 easyaur "$pkgdir/usr/bin/eaur"
}


