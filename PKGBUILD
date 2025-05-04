pkgname=bi
pkgver=3.4.4.4
pkgrel=1
pkgdesc="Binary editor like vI"
arch=('any')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/bi/archive/refs/heads/v$pkgver.zip")
sha256sums=('315d5d4694402effe78ec8a319445269e2c8e5d51a8ded1a8ee6157cbb8f7155')

build() {
  echo "bi"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
