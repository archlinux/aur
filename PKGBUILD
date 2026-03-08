pkgname=arts
pkgver=1.0
pkgrel=1
pkgdesc="Another Ridiculous Time Saver - an AUR helper"
arch=('x86_64')
url="https://github.com/Dronables/arts"
license=('GPL3')
depends=('git' 'base-devel' 'go')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    go build -o arts .
}

package() {
    install -Dm755 "$srcdir/$pkgname/arts" "$pkgdir/usr/bin/arts"
}
