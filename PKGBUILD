# Maintainer: czyt <czytcn@gmail.com>

pkgname=iris-screenshot-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="Screenshots of live websites. Minimal interface, powerful engine."
arch=('x86_64')
url="https://github.com/brijr/iris"
license=('MIT')
optdepends=('chromium: headless browser used to capture screenshots')
conflicts=('iris-bin')
_archive="iris-${pkgver}.tar.gz"
source=("${_archive}::https://github.com/brijr/iris/releases/download/v${pkgver}/iris-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('aa6073ba255c0bcf09364a5503cbd4794791b832e5934a52b169a455d66101c7')

package() {
  install -Dm755 "${srcdir}/iris" "${pkgdir}/usr/bin/iris"
}
