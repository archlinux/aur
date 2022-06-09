# Maintainer: valorl <valer@valorl.dev>

pkgname=golangci-lint-langserver-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="golangci-lint language server"
arch=('x86_64')
url="https://github.com/nametake/golangci-lint-langserver"
license=('MIT')
source=("https://github.com/nametake/golangci-lint-langserver/releases/download/v${pkgver}/golangci-lint-langserver_linux_${arch}.tar.gz")
sha256sums=('a3e4b7b64070738ed8bafc6e932c089ffd812ff6b14ce7572a4eacbddb2bd7e4')

package() {
  install -Dm 755 "$srcdir/golangci-lint-langserver" "$pkgdir/usr/bin/golangci-lint-langserver"
}
