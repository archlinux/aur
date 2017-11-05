# Maintainer: Max Struebing mxstrbng@gmail.com

pkgname=tldr-go-client-git
pkgver=1.1.0
pkgrel=1
pkgdesc="fast TLDR client written in Golang"
arch=(any)
url="https://github.com/mstruebing/tldr"
license=('MIT')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url")
md5sums=('SKIP')
provides=('tldr')

build() {
    cd "$srcdir"
    make build
}

package() {
    cd "$srcdir"
    install -Dm755 ./bin/tldr "$pkgdir/usr/bin/tldr"
}
