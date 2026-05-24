# Maintainer: Olivia Mackintosh <liv@base.nu>

pkgname=aelapse-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="ÆLAPSE is a delay and reverb plugin. The delay is based on tape-delay mechanisms, while the reverb is inspired by (but not limited to) spring reverbs."
arch=(x86_64)
url="https://github.com/smiarx/aelapse/"
license=(GPLv3)
groups=(vst3-plugins lv2-plugins)
makedepends=(git)
provides=("${pkgname%-*}")
source=("https://github.com/smiarx/aelapse/releases/download/v${pkgver}/Aelapse-Linux.zip")
sha256sums=('9e6726d09c2d0cd49d8d4a9f45757dec2913e0ec4003ebd5aa4a0bef149cec77')

package() {
  mkdir -p "$pkgdir"/usr/lib/{vst3,lv2}
  cp -r VST3/* "$pkgdir"/usr/lib/vst3
  cp -r LV2/* "$pkgdir"/usr/lib/lv2
}
