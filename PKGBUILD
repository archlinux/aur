# Maintainer: Keiran <keiran@keircn.com>
pkgname=karu-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line tool for downloading and watching anime (binary)"
arch=('x86_64')
url="https://github.com/keircn/karu"
license=('MIT')
depends=()
provides=('karu')
conflicts=('karu')
source=("karu-$pkgver.tar.gz::https://github.com/keircn/karu/releases/download/v$pkgver/karu-linux-amd64.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/keircn/karu/v$pkgver/LICENSE")
sha256sums=('SKIP'
  'SKIP')

package() {
  install -Dm755 "$srcdir/karu-linux-amd64" "$pkgdir/usr/bin/karu"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
