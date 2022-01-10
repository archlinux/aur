# Maintainer: drarig29 <corentingirard.dev@gmail.com>
# Maintainer: arthursonzogni <sonzogniarthur@gmail.com>

pkgname=json-tui-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A JSON terminal UI made in C++"
arch=("x86_64")
url="https://github.com/ArthurSonzogni/json-tui"
license=("MIT")
provides=("json-tui")
conflicts=("json-tui")
source=("https://github.com/ArthurSonzogni/json-tui/releases/download/v${pkgver}/json-tui-${pkgver}-Linux.tar.gz")
sha256sums=('544aec75b412eb9cf22c5d93497c2f8877d3dbc5cc79a55dd836a5fd6f1d0ca1')

package() {
  install -Dm755 json-tui-${pkgver}-Linux/bin/json-tui -t "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
