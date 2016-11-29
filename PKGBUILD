# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=wego
pkgver=2.0
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('any')
license=('ISC')
makedepends=('go')

build() {
  GOPATH="$srcdir" go get github.com/schachmat/wego
}

package() {
  install -Dm755 bin/wego "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir"/src/github.com/schachmat/wego/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
