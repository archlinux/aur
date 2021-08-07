# Maintainer: Viktor A. Rozenko Voitenko <sharpvik@gmail.com>
pkgname=sema
pkgver=0.1.0
pkgrel=1
pkgdesc="Semantic commit tool"
arch=(x86_64)
url="https://github.com/sharpvik/sema"
license=('MIT')
depends=()
makedepends=(git go)
provides=(sema)
conflicts=()
replaces=()
backup=()
options=()
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    go build
}

package() {
    cd "$pkgname"
	go install || mv "$pkgname" ~/.local/bin/
}
