pkgname=bi
pkgver=3.4.3.1
pkgrel=1
pkgdesc="Binary editor like vI"
arch=('any')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/bi/archive/refs/heads/v$pkgver.zip")
sha256sums=('7da578577e6f562c9970c951cbced1483b0c9896b0a145e673436e37aa8ef582')

build() {
  echo "bi"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
