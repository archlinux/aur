#Maintainer: VPeti1 (Vasko Peter) 

pkgname=pama
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="Simple and secure password manager made in Go"

depends=('go' 'git')

source=("https://github.com/VPeti1/CWAcces/raw/main/pama.tar.gz")

sha256sums=('0d11c6b8ac5bd3e19e97f578f5e485dbabcaa9247b9ebb9fe7699bd93d730b9b')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/pama"
}
