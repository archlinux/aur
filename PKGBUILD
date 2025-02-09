# Maintainer: valorl <valer@valorl.dev>

pkgname=golangci-lint-langserver-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="golangci-lint language server"
arch=('x86_64')
url="https://github.com/nametake/golangci-lint-langserver"
license=('MIT')
source=("https://github.com/nametake/golangci-lint-langserver/releases/download/v${pkgver}/golangci-lint-langserver_linux_${arch}.tar.gz")
sha256sums=('5c9d0be947d9e61b0df241d90e13454a38b928f011b45044c5f11d97e637caf9')

package() {
  install -Dm 755 "$srcdir/golangci-lint-langserver" "$pkgdir/usr/bin/golangci-lint-langserver"
}
