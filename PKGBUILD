# Maintainer: Ben Word <ben@benword.com>
pkgname=quien-bin
_pkgname=quien
pkgver=0.6.2
pkgrel=1
pkgdesc="A better WHOIS lookup tool with interactive TUI (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('6f1f0e93b6c022a14a11de6dc12c4909c2b489366dc7e71408e9a4a83e3c9800')
sha256sums_aarch64=('04a4d9bd2b96a6f629ab9b41942f0a3929663b2f861f18eaa3f801c36ac79633')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
