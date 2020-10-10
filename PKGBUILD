# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2020.10.10
pkgrel=1
pkgdesc='A minimal and opinionated linter for Clojure code that sparks joy.'
arch=('x86_64')
url='https://github.com/borkdude/clj-kondo'
license=('EPL')
provides=('clj-kondo')
conflicts=('clj-kondo')

source=("https://github.com/borkdude/clj-kondo/releases/download/v${pkgver/_/-}/${pkgname/\-bin/}-${pkgver/_/-}-linux-amd64.zip")

sha256sums=('58a87022d0206543c8b4d60e82f981306fd453cd212df865eea02220ae107234')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
