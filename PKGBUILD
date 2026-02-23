# Maintainer: Maksymilian Wrzesień <dev at wrzesien dot me>

pkgname=golangci-lint-langserver-bin
_pkgname=${pkgname%-bin}
pkgver=0.0.12
pkgrel=1
pkgdesc="golangci-lint language server"
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')
url="https://github.com/nametake/golangci-lint-langserver"
license=('MIT')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nametake/golangci-lint-langserver/releases/download/v${pkgver}/golangci-lint-langserver_linux_${arch}.tar.gz")
sha256sums=('7c4a200f34af3de4188a792ba676994ce5fdb181dd4731e10cd3cc501e722b28')

package() {
  install -Dm 755 "$srcdir/golangci-lint-langserver" "$pkgdir/usr/bin/golangci-lint-langserver"
}
