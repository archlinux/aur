pkgname=bi
pkgver=3.4.2.0
pkgrel=8
pkgdesc="Binary editor like vI"
arch=('any')
url="https://github.com/fygar256/bi"
license=('MIT')
depends=('python')
source=("https://aur.archlinux.org/bi.git/$pkgname-$pkgver.zip")
sha256sums=('7d60a178f88a3f8320b8b619c8f38097a0f682c9b1a32873b74a3b5391558b93')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bi.py "$pkgdir/usr/bin/bi"
  install -Dm644 "$srcdir/$pkgname-$pkgver/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
