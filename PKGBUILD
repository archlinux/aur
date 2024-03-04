# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.60
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/koboldcpp-linux-x64")
sha256sums=('f92e5c577f9435463ee9187f6b1e63d5f549a67634bd0de0b3ef933a18ccb7ed')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64 ${pkgdir}/usr/bin/${_pkgname}
}
