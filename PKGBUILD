# Maintainer: Viktor A. Rozenko Voitenko <sharp.vik@gmail.com>
pkgname=sema
pkgver=0.2.4
pkgrel=7
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
    mkdir -p ~/go/bin/
    cd $pkgname
    go install
}
