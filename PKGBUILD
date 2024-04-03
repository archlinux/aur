#Maintainer: VPeti1 (Vasko Peter) 

pkgname=aiopmplus
pkgver=5
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="The argument based implementation of AIOPM"

depends=('wget' 'gcc' 'git')

source=("https://github.com/VPeti1/CWAcces/raw/main/aiopmplus.tar.gz")

sha256sums=('b22e8c2e946ad63cdfcb7597a2f2e3c147b0a99f34ed66a25679bb7bd3f379ea')

build() {
    cd "$srcdir"
    g++ -o aiopmplus main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 aiopmplus "$pkgdir/usr/bin/pm"
}


