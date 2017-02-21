# Maintainer: Mark Riedesel <mark@klowner.com>

pkgname=yegonesh
pkgver=20151102
pkgrel=3
pkgdesc="Yeganesh-like dmenu wrapper written in Go"
arch=('x86_64' 'i686')
url="http://github.com/klowner/yegonesh"
license=('MIT')
makedepends=('go')
depends=('dmenu')
options=('!strip' '!emptydirs')
source=(
  'https://raw.githubusercontent.com/Klowner/yegonesh/master/main.go'
)
sha256sums=(
  '5262fbea59aa1fa2cfd06b8642d44ff23586314cced8cb2b30f5cf7804a5f3fb'
)

build() {
  go build -o "yegonesh"
}

package() {
  install -Dm755 "yegonesh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
