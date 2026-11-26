# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=picolimbo-bin
pkgver=1.15.0+mc26.3
pkgrel=1
pkgdesc="Lightweight Minecraft limbo server supporting many protocol versions"
arch=('x86_64' 'aarch64')
url="https://github.com/Quozul/PicoLimbo"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pico_limbo_linux-x86_64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pico_limbo_linux-aarch64-gnu.tar.gz")
sha256sums_x86_64=('091d7595738bf07f27299c50a3cc0ac7b1a44e510539141dcd9049e364f4015b')
sha256sums_aarch64=('891bde2112a153e943479068c5bf21570e59fc8084167332a1979d5aae79d8be')

package() {
  install -Dm755 "pico_limbo" "${pkgdir}/usr/bin/pico_limbo"
}
