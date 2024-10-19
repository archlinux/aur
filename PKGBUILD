pkgname=cpdiff
pkgver=2.0
pkgrel=1
pkgdesc="File difference tool for competitive programming"
arch=('x86_64')
license=('MIT')
depends=('go')
source=("https://github.com/ChrisVilches/cpdiff/archive/refs/tags/v2.0.tar.gz")
sha256sums=('SKIP') # Replace with actual checksum if desired

build() {
  echo "here:::::::::"
  echo "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    go build -o "$pkgname"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

