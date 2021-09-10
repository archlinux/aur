# Maintainer: Ameya Shenoy <archlinux@codingcoffee.me>

_pkgname='kgctl'

pkgname="$_pkgname-bin"
pkgver=0.3.1
pkgrel=1
pkgdesc="a command line tool provided by Kilo for inspecting and interacting with clusters"
arch=('x86_64')
url="https://github.com/squat/kilo"
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::https://github.com/squat/kilo/releases/download/$pkgver/$_pkgname-linux-amd64")
sha256sums=('7dd9d4b610376d73ebb61ebecfa841031cc36bd3810bd145d83003e2b624ddc3')

package() {
  install -D -m755 "./$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

