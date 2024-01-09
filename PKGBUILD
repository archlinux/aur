# Maintainer: OGrigorios <aur@giotas.io>

pkgname=lazysql
pkgver=0.1.2
pkgrel=1
pkgdesc="A cross-platform TUI database management tool written in Go"
arch=('x86_64')
url="https://github.com/jorgerojas26/lazysql"
license=('MIT')

source_x86_64=("https://github.com/jorgerojas26/lazysql/releases/download/v$pkgver/lazysql_Linux_x86_64.tar.gz")
sha256sums_x86_64=('6da32058ad7249c82244006f0a4b61ed23bae637e2cb839587a46000357c53f3')

package() {
  cd "$srcdir"
  install -Dm755 "lazysql" "$pkgdir/usr/bin/lazysql"
}

