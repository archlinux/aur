# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=speedtest-zpeters
pkgver=1.0.0
pkgrel=1
pkgdesc='Command line client for speedtest.net written in Go'
url=https://github.com/zpeters/speedtest
arch=('any')
license=('GPL3')
makedepends=('go')

build() {
  GOPATH="$srcdir" go get github.com/zpeters/speedtest
}

package() {
  install -Dm755 bin/speedtest "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
