pkgname=axx
pkgver=6.8.5
pkgrel=1
pkgdesc="axx general assembler"
arch=('any')
url="https://github.com/fygar256/axx"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/axx/archive/refs/heads/v$pkgver.zip")
sha256sums=('d5e761f58799f316188dbb8759a7ee7bfe7a3f5611be3bd169f133b5bc3ee609')

build() {
  echo "axx"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 axx.py "$pkgdir/usr/bin/axx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
