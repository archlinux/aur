#Maintainer: VPeti1 (Vasko Peter) 

pkgname=lvc
pkgver=2
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="A simple version control system"

depends=('go' 'git')

source=("https://github.com/VPeti1/CWAcces/raw/main/lvc.tar.gz")

sha256sums=('db96a37672a4edec868b9ab92c3235f6074076881afcfd375c92775601d5a702')

build() {
    cd "$srcdir"
    go build main.go
}

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/lvc"
}


