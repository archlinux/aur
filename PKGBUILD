pkgname=lexido
pkgver=1.2
pkgrel=1
arch=('any')
url="https://github.com/micr0-dev/lexido"
license=('GAPL')
makedepends=('go')
source=("lexido-1.2.tar.gz::https://github.com/micr0-dev/lexido/archive/refs/tags/1.2.tar.gz")  # Corrected syntax
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o $pkgname
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
