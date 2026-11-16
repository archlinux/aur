# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=godap-bin
_pkgname="${pkgname%-bin}"
pkgver=v2.12.2
pkgrel=1
pkgdesc="A complete TUI for LDAP."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Macmod/godap"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
sha512sums_x86_64=('69263e0f9213592e47d5a3345678512944ca586b9c572538431167466ec1fc44cc454ef53898e965aaf4b5eeaf1f5041c4a11f80141201b04a75bac58f37856c')
source_i686=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-386.tar.gz")
sha512sums_i686=('8849ebbe152ba0ac599ea0bc74743cfb14306a5bff1f3b1cdce338b80ae071cd10c64546e1d22e8fbb876f8a3ece49793455bdfdceb0dd8d292277ca46c3f1be')
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-arm64.tar.gz")
sha512sums_aarch64=('45e05700c83d3c0c9b505cdff89b1e6f185947b17e2cff5bd3b4cbeef1b5dbc39c3c947d82e23620fa2e5cbd459dbae078c20657c82945e4eb4f1ad4a84a1829')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}

