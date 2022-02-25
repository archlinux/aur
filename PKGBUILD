# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

pkgname=bombardier
pkgver=1.2.5
pkgrel=1
pkgdesc="Crossplatform HTTP benchmarking tool written in Go"
arch=('x86_64')
url="https://github.com/codesenberg/bombardier"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/codesenberg/$pkgname/releases/download/v$pkgver/bombardier-linux-amd64")
b2sums=('c517eada24bff73dd2b013734a2cd52e06980d9696c21834f4bd6524540061ee924aa27493c67fe30ed689bd7d731cc02034b98a5466307c92ad6f66a58589e8')

package() {
  install -Dm755 "$pkgname-linux-amd64" "$pkgdir/usr/bin/$pkgname"
}
