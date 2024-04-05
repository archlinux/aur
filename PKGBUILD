#Maintainer: VPeti1 (Vasko Peter) 

pkgname=startup-apps
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A startup app creator"

depends=('gcc')

source=("https://github.com/VPeti1/CWAcces/raw/main/startup-apps.tar.gz")

sha256sums=('9272bebb2d95e5e0d3fadf4cd82794cc158d2290b6a1ba44e45c7c8a0ea58d18')

build() {
    cd "$srcdir"
    g++ -o startupapps main.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 startupapps "$pkgdir/usr/bin/startupapps"
}


