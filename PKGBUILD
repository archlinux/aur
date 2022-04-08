# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2022.04.08
pkgrel=1
pkgdesc='A minimal and opinionated linter for Clojure code that sparks joy.'
arch=('x86_64')
url='https://github.com/borkdude/clj-kondo'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-static-amd64.zip")

sha256sums_x86_64=('c32daf5a68dfb6563d8d612bdefc1987dcd486cb434ffa2452cbf135fda8e7bc')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
