pkgname=lexido
pkgver=v1.2
pkgrel=1
arch=('x86_64')
url="Your project URL here"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP') # Consider using actual sha256sums for source validation

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o $pkgname
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
