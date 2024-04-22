#Maintainer: VPeti1 (Vasko Peter) 

pkgname=gohash
pkgver=2
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="Calculate a files SHA256 sum with 1 command "

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/gohash.tar.gz")

sha256sums=('6bb1c7b061c35c10abcab2c3c8caa6193ca5707bf36be8a5afd7e4688cf1bfb6')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/gohash"
}


