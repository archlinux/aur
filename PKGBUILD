pkgname=lexido
pkgver=1.2.2
pkgrel=1
arch=('any')
url="https://github.com/micr0-dev/lexido"
license=('GAPL')
makedepends=('go')
source=("https://github.com/micr0-dev/lexido/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/lexido-$pkgver"
    /usr/local/go/bin/go build -o "$pkgname"
}

package() {
    install -Dm755 "$srcdir/lexido-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
