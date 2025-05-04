pkgname=bi
pkgver=3.4.3.5
pkgrel=4
pkgdesc="Binary editor like vI"
arch=('any')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/bi/archive/refs/heads/v$pkgver.zip")
sha256sums=('7a5f2f20a36bbe30ac9378f909865889555728c5c2a25af03e17c9f2c5c1a188')

build() {
  echo "bi"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
