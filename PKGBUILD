#Maintainer: VPeti1 (Vasko Peter) 

pkgname=cwplus
pkgver=2
pkgrel=1
arch=('x86_64')

license=('GPL2')
pkgdesc="The GUI version of OpenCW/CW-I"

depends=('gcc' 'git' 'python3')

source=("https://github.com/VPeti1/CWAcces/raw/main/cwplus.tar.gz")

sha256sums=('95602551c1c089520b60d26578bdb136ca721d52a4caa6d8395a3c71e4e371d2')

build() {
    cd "$srcdir"
    g++ -o cwplus installer.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 cwplus "$pkgdir/usr/bin/cwplus"
}


