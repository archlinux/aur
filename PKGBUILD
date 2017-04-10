# Maintainer: Brandon Carrell <brandoncarrell@gmail.com>

pkgname=joker
pkgver=0.7.2
pkgrel=1
pkgdesc="Joker, a Clojure interpreter and linter written in Go - Precompiled binary from official repository"
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
provides=('joker')
conflicts=('joker')

source=("https://github.com/candid82/joker/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64.zip")

md5sums=('f68727f205d0dcb83cb804157f2cf16f')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}