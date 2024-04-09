#Maintainer: VPeti1 (Vasko Peter) 

pkgname=gohash
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="Calculate a files SHA256 sum with 1 command "

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/gohash.tar.gz")

sha256sums=('00fdb7b019ce012167f49be9188611f13bcaa0d7304103fdd7816e30b4e5069b')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/gohash"
}


