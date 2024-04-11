#Maintainer: VPeti1 (Vasko Peter) 

pkgname=goaiopmplus
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="AIOPM Plus but in Go"

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/goaiopmplus.tar.gz")

sha256sums=('29840c155058a4f5262af30cd1a71e4b9a9f4cb85a5567c13595790c4505759e')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/gopm"
}


