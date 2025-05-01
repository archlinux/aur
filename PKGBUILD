pkgname=bi
pkgver=3.4.3.2
pkgrel=3
pkgdesc="Binary editor like vI"
arch=('any')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/bi/archive/refs/heads/v$pkgver.zip")
sha256sums=('9fbf758338008ebf864f9cfdc2a9dbb2838d8a84f3c21116e5bcf692c6d08a64')

build() {
  echo "bi"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
