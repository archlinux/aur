# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=koboldcpp
pkgname=koboldcpp-bin
pkgver=1.64.1
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI. (Requires AVX2 support)"
arch=('x86_64')
url="https://github.com/LostRuins/${_pkgname}"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=("https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/${_pkgname}-linux-x64-cuda1150")
sha256sums=('05e98fca8e69dda910c120dcdc743e4c6b8a5772c5aaa5ec0a98b95be9ba38e2')

package() {
  install -D -m 0755 ${_pkgname}-linux-x64-cuda1150 ${pkgdir}/usr/bin/${_pkgname}
}
