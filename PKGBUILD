# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=nmtui-go
pkgver=0.2.7
pkgrel=1
pkgdesc="A TUI for managing NetworkManager Wi-Fi connections on Linux"
arch=('x86_64')
url="https://github.com/doeixd/nmtui-go"
license=('MIT')
depends=('networkmanager')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/doeixd/nmtui-go/releases/download/v$pkgver/nmtui-go_${pkgver}_linux_amd64.tar.gz")
sha256sums=('84242289371438e66bec09aee6edddf423e3a196cc2f30ba573e3a18967905c6')

package() {
  install -Dm755 "$srcdir/nmtui-go" "$pkgdir/usr/bin/nmtui-go"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

