# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jtesta/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a8f4f01122234bd84c01440bfd3b7a6026c50c1a06f3044846a8503c94f94cfb')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ssh-audit.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
