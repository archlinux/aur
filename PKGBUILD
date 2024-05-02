# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.64
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda1150")
sha256sums=('c55a7e917a01c5384376bd622a75f6675f6f3e2aad47f9773eeca115df4c1bc5')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64-cuda1150 ${pkgdir}/usr/bin/${_pkgname}
}
