pkgname=bi
pkgver=3.4.1.5
pkgrel=1
pkgdesc="Binary editor like vI"
arch=('x86_64')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/bi/archive/refs/heads/v3.4.1.4.zip")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
  install -Dm644 "${srcdir}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  
}
