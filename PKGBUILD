#Maintainer: VPeti1 (Vasko Peter) 

pkgname=lvc
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple version control system"

depends=('go' 'git')

source=("https://github.com/VPeti1/CWAcces/raw/main/lvc.tar.gz")

sha256sums=('af2fdf466b0d110a881308ed7618fa042cd4d78d456040fd06919d82f2c323e3')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/lvc"
}


