#Maintainer: VPeti1 (Vasko Peter) 

pkgname=aiopmplus
pkgver=6
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="The argument based implementation of AIOPM"

depends=('wget' 'gcc' 'eaur')

source=("https://github.com/VPeti1/CWAcces/raw/main/aiopmplus.tar.gz")

sha256sums=('e1d2fa51bfb38c184eff0622f81e59a5551e448dcb3cc8cd310f399a7be6bd19')

build() {
    cd "$srcdir"
    g++ -o aiopmplus arch.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 aiopmplus "$pkgdir/usr/bin/pm"
}


