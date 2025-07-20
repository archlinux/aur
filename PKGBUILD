# Maintainer: Praneeth Ashok Kumar <praneethashok14@gmail.com>
pkgname=guessgame
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Rust-based number guessing game"
arch=('x86_64')
url="https://github.com/praneethashok14/guessgame"
license=('MIT')
depends=()
makedepends=('rust')
source=("$pkgname::git+https://github.com/praneethashok14/guessgame.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/guessgame "$pkgdir/usr/bin/guessgame"
}

