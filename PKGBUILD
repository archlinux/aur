# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clj-kondo-bin
pkgver=2022.12.10
pkgrel=1
pkgdesc='A minimal and opinionated linter for Clojure code that sparks joy.'
arch=('x86_64')
url='https://github.com/borkdude/clj-kondo'
license=('EPL')
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-static-amd64.zip")

sha256sums_x86_64=('937298a30b4ef6ab765183394b7afa70624e377cc177a70c3d5b936540bf8730')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
