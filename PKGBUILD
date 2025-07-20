# Maintainer: Praneeth Ashok Kumar <praneethashok14@gmail.com>
pkgname=calcli
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Rust-based calculator for the terminal"
arch=('x86_64')
url="https://github.com/praneethashok/calcli"
license=('MIT')
depends=()
makedepends=('rust')
source=("$pkgname::git+https://github.com/praneethashok/calcli.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 calcli "$pkgdir/usr/bin/calcli"
}

