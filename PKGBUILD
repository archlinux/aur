# Maintainer: drarig29 <corentingirard.dev@gmail.com>
# Maintainer: arthursonzogni <sonzogniarthur@gmail.com>

pkgname=json-tui-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A JSON terminal UI made in C++"
arch=("x86_64")
url="https://github.com/ArthurSonzogni/json-tui"
license=("MIT")
provides=("json-tui")
conflicts=("json-tui")
source=("https://github.com/ArthurSonzogni/json-tui/releases/download/v${pkgver}/json-tui-${pkgver}-Linux.tar.gz")
sha256sums=('43b76c17b1577a6ff55261d2b90ad1d9b6e09d0b3e76d63be87ef80b1ca77262')

package() {
  install -Dm755 json-tui-${pkgver}-Linux/bin/json-tui -t "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
