# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.1.0
pkgrel=1
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jtesta/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0c689500b2e2d4496914b5e100705ef8289c21d7b5f0d081470ae25e5b661f63')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ssh-audit.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
