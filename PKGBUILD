#Maintainer: VPeti1 (Vasko Peter) 

pkgname=goflex-bin
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL3')
pkgdesc="FlexPkg clone made in Go"

depends=('go' 'git' 'wget')

source=("https://github.com/VPeti1/CWAcces/raw/main/goflexbin.tar.gz")

sha256sums=('a52a80a90d27e30c31306e3d9f98374a681b91e61029c8e9fa70a564b875777b')

package() {
    cd "$srcdir"
    install -Dm755 main "$pkgdir/usr/bin/goflex"
}


