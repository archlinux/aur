pkgname=bi
pkgver=3.4.1.4
pkgrel=1
pkgdesc="Vinary editor like vI"
arch=('x86_64')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/bi/archive/refs/heads/v3.4.1.4.zip")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make  # makeが必要な場合
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
}
