# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=golangci-lint-langserver-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="golangci-lint language server"
arch=('x86_64')
url="https://github.com/nametake/golangci-lint-langserver"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nametake/golangci-lint-langserver/releases/download/v${pkgver}/golangci-lint-langserver_linux_${arch}.tar.gz")
sha256sums=('b4efa95267c29ca4d08e0a977e90e7c6a8a606bafe1dcedfd5e48e952536b331')

package() {
  install -Dm 755 "$srcdir/golangci-lint-langserver" "$pkgdir/usr/bin/golangci-lint-langserver"
}
