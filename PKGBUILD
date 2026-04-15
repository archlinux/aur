# Maintainer: Ben Word <ben@benword.com>
pkgname=quien-bin
_pkgname=quien
pkgver=0.7.0
pkgrel=1
pkgdesc="A better WHOIS lookup tool with interactive TUI (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('14e1f5e2b5b8a5ffcf135e350da92833e3e542c95684a0cb653c9a3b07f53996')
sha256sums_aarch64=('34599bb8b0e54b642b79ccd69cb8bb19937f0478003d26d2adbbcae6b3f24156')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
