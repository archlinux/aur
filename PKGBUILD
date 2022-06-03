# Maintainer: Viktor A. Rozenko Voitenko <sharp.vik@gmail.com>
pkgname=sema
pkgver=0.2.3
pkgrel=5
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
    cd $pkgname
    go build -o $pkgname
    mv $pkgname /usr/local/bin/
}
