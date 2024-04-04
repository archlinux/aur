#Maintainer: VPeti1 (Vasko Peter) 

pkgname=gitall
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc=" Apply git commands to multiple repos "

depends=('gcc' 'git')

source=("https://github.com/VPeti1/CWAcces/raw/main/gitall.tar.gz")

sha256sums=('1d1534f5589250934b956497d97fcf462b9a3ffe2ca4da8312ee7c1efe29ffea')

build() {
    cd "$srcdir"
    g++ -o gitall main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 gitall "$pkgdir/usr/bin/gitall"
}


