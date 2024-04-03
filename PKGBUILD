#Maintainer: VPeti1 (Vasko Peter) 

pkgname=aiopmplus
pkgver=5.5
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="The argument based implementation of AIOPM"

depends=('wget' 'gcc' 'eaur')

source=("https://github.com/VPeti1/CWAcces/raw/main/aiopmplus.tar.gz")

sha256sums=('0015ffb349d307628eb31709ba385da94bcfcb18ac12ec906a0aa5aeb87e381a')

build() {
    cd "$srcdir"
    g++ -o aiopmplus arch.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 aiopmplus "$pkgdir/usr/bin/pm"
}


