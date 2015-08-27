# Maintainer: Mark Riedesel <mark@klowner.com>

pkgname=yegonesh
pkgver=20150827
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
  '9e4dbf9bf811944cbca05b438e120e7c49914671bd49569f88cdcf0e50727513'
)

build() {
  go build -o "main.go"
}

package() {
  install -Dm755 "main.go" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
