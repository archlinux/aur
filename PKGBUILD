# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=hacker-laws-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI tool displaying hacker laws from the hacker-laws GitHub repository"
arch=('x86_64')
url="https://github.com/umutphp/hacker-laws-cli"
license=('unknown')
makedepends=('go')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname
    go build .
}

package() {
    cd $srcdir/$pkgname
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
