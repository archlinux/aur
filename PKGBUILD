# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
_cudaversion=1210
pkgname=koboldcpp-bin
pkgver=1.68
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda1210")
sha256sums=('cc8ad0164132f35381225ea2872c1781321a8e7ba3cc908cbcf9d229aeb13e5c')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64-cuda${_cudaversion} ${pkgdir}/usr/bin/${_pkgname}
}
