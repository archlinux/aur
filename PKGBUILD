# Maintainer: Mark Riedesel <mark@klowner.com>

pkgname=yegonesh
pkgver=20150928
pkgrel=1
pkgdesc="Yeganesh-like dmenu wrapper written in Go"
arch=('x86_64' 'i686')
url="http://github.com/klowner/yegonesh"
license=('MIT')
depends=('go' 'dmenu')
options=('!strip' '!emptydirs')
source=(
  'https://raw.githubusercontent.com/Klowner/yegonesh/master/main.go'
)
sha256sums=(
  '04669bd83e53b7e5049ab56aec1784c15f5594a2db68b554b059dce03cce2ccc'
)

build() {
  go build -o "main.go"
}

package() {
  install -Dm755 "main.go" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
