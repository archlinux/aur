# Maintainer: Viktor A. Rozenko Voitenko <sharp.vik@gmail.com>
pkgname=sema
pkgver=0.3.0
pkgrel=8
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

package() {
    mkdir -p $(go env GOPATH)/bin
    cd $pkgname
    go install
}
