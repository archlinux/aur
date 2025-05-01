pkgname=axx
pkgver=1.0.0
pkgrel=2
pkgdesc="axx general assembler"
arch=('any')
url="https://github.com/fygar256/general-assembler-axx"
license=('MIT')
depends=('python')
source=("https://github.com/fygar256/general-assembler-axx/archive/refs/heads/v$pkgver.zip")
sha256sums=('e773da6bc633aff982cb0c727a2addee2a0c137617b806584e9730e38383b2eb')

build() {
  echo "axx"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 axx.py "$pkgdir/usr/bin/axx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
