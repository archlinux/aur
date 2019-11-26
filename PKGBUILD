# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.1.1
pkgrel=1
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jtesta/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e70d7dfb98fa4941f07424783a2f601c9e3920eb33da53997c13b9d7d2720dcb')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ssh-audit.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
