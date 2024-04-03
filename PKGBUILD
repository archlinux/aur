#Maintainer: VPeti1 (Vasko Peter) 

pkgname=aiopm
pkgver=1.9
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="All in one package manager for linux"

depends=('gcc' 'eaur')

source=("https://github.com/VPeti1/CWAcces/raw/main/aiopm.tar.gz")

sha256sums=('118d5dd1461c229ee83eef91a4a811b796982a3f8b3849692dfbf5211042cc55')

build() {
    cd "$srcdir"
    sudo mkdir /usr/aiopm
    sudo touch /usr/aiopm/a1.cw
    g++ -o aiopm main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 aiopm "$pkgdir/usr/bin/aiopm"
}


