# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
_cudaversion=1210
pkgname=koboldcpp-bin
pkgver=1.69
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda1210")
sha256sums=('110626b38c161721ca6934def32811be41fabaf9ac7f911d7eb9c050e887f421')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64-cuda${_cudaversion} ${pkgdir}/usr/bin/${_pkgname}
}
