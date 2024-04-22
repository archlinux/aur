#Maintainer: VPeti1 (Vasko Peter) 

pkgname=newgitall
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="Gitall but in Go"

depends=('go' 'git' 'wget')
conflicts=('gitall')

source=("https://github.com/VPeti1/CWAcces/raw/main/newgitall.tar.gz")

sha256sums=('b7c4c4670adbcd027352086ee4faa593eb78cff6ca51078332ccb1435ec2cd3b')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/gitall"
}


