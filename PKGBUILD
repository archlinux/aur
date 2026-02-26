# Maintainer: Keithsel <keithsel@disroot.org>
pkgname=nmtui-go
pkgver=0.2.6_beta.2
pkgrel=1
pkgdesc="A TUI for managing NetworkManager Wi-Fi connections on Linux"
arch=('x86_64')
url="https://github.com/doeixd/nmtui-go"
license=('MIT')
depends=('networkmanager')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/doeixd/nmtui-go/releases/download/v0.2.6-beta.2/nmtui-go_0.2.6-beta.2_linux_amd64.tar.gz")
sha256sums=('183d622238314e7f519d3e7e66a7782c7b3987afe5fc4a48033c17bd1404d3c3')

package() {
  install -Dm755 "$srcdir/nmtui-go" "$pkgdir/usr/bin/nmtui-go"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

