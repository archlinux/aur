# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
_cudaversion=1210
pkgname=koboldcpp-bin
pkgver=1.67
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda1210")
sha256sums=('b7858959c69da9740bc27a62ff6c72e071cee07f5fea4875a57cc7ed7a6d89ce')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64-cuda${_cudaversion} ${pkgdir}/usr/bin/${_pkgname}
}
