# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.57.1
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/koboldcpp-linux-x64")
sha256sums=('8fbfd4f4e407eccc3d02a8c8d3e4981b8ca513df667e61d35119f85054070cd0')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64 ${pkgdir}/usr/bin/${_pkgname}
}
