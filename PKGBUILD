# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
_cudaversion=1210
pkgname=koboldcpp-bin
pkgver=1.66
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda1210")
sha256sums=('d9ecbf52d2cd72881388517fa2408234dcee50a709bc511ee64bc2580540a8bf')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64-cuda${_cudaversion} ${pkgdir}/usr/bin/${_pkgname}
}
