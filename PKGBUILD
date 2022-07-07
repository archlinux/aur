# Maintainer: GG weebcyberpunk@gmail.com
pkgname=blin-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Breaks lines in last-blank."
arch=("x86_64")
url="https://www.github.com/weebcyberpunk/blin"
license=('MIT')
provides=(blin)
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "blin"
    make
}

package() {
    cd "blin"
    install -Dm755 blin $pkgdir/usr/bin/blin
    install -Dm644 blin.1 $pkgdir/usr/share/man/man1/blin.1
}
