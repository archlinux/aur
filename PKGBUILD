# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=gotty
pkgver=0.0.13
pkgrel=1
epoch=1
pkgdesc='Share your terminal as a web application'
url=https://github.com/yudai/gotty
arch=('any')
license=('MIT')
makedepends=('git' 'go')

build() {
  GOPATH="$srcdir" go get github.com/yudai/gotty
}

package() {
  install -Dm755 bin/gotty "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir"/src/github.com/yudai/gotty/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
