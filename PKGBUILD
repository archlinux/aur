#Maintainer: VPeti1 (Vasko Peter) 

pkgname=goddos
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple DDossing utility made in Go"

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/goddos.tar.gz")

sha256sums=('3c90d73736a45f4200a85480615d0b9f3ad6d8505f31de3c0034caad1cb1ed17')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/goddos"
}


