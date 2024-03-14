# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.61.2
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/koboldcpp-linux-x64")
sha256sums=('e0c3a168022bb4050a91a17da606151cb9d982fd133ec57355538b69364aeaab')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64 ${pkgdir}/usr/bin/${_pkgname}
}
