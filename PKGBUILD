#Maintainer: VPeti1 (Vasko Peter) 

pkgname=goaiopm
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="AIOPM but in Go"

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/goaiopm.tar.gz")

sha256sums=('6e6a5fdff3e09de28acf718c45364bc6b2a1d420bc7733fd13f21eafaa5326ca')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/goaiopm"
}


