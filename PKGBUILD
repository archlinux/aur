# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.62.1
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/koboldcpp-linux-x64")
sha256sums=('93b63acb4d0fafee062ec7c63920a01026fbc702f94417c64780e6eb0afebf4c')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64 ${pkgdir}/usr/bin/${_pkgname}
}
