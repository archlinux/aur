pkgname=ayaan
pkgver=0.1.0
pkgrel=1
pkgdesc="AyaanScript+ runtime and ASPKG package manager"
arch=('x86_64')
url="https://aur.archlinux.org/packages/ayaan"
license=('MIT')
depends=('glibc')
makedepends=('cargo')

build() {
  cargo build --release
}

package() {
  install -Dm755 target/release/ayaan "$pkgdir/usr/bin/ayaan"
  install -Dm755 target/release/aspkg "$pkgdir/usr/bin/aspkg"
}
