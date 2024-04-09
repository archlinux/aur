#Maintainer: VPeti1 (Vasko Peter) 

pkgname=goflex
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="FlexPkg clone made in Go"

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/goflex.tar.gz")

sha256sums=('8ea3403f0bb203b21da406fa105d333eddb8ded78d0124608be57b6969221245')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/goflex"
}


