# Maintainer: drarig29 <corentingirard.dev@gmail.com>

pkgname=json-tui-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A JSON terminal UI made in C++"
arch=("x86_64")
url="https://github.com/ArthurSonzogni/json-tui"
license=("MIT")
provides=("json-tui")
conflicts=("json-tui")
source=("https://github.com/ArthurSonzogni/json-tui/releases/download/v${pkgver}/json-tui-${pkgver}-Linux.tar.gz")
sha256sums=('6d8eacf5d23539d8bbe7b890f26ff58aafdba0ce0e06d5252dff642faf32a6ad')

package() {
  install -Dm755 json-tui-${pkgver}-Linux/bin/json-tui -t "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
