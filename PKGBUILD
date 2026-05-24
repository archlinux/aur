# Maintainer: Olivia Mackintosh <liv@base.nu>

pkgname=sirial-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Sirial is a Rhythmic Delay where each tap can be placed and configured with different amplitudes and feedback giving total control on how the delay responds and the patterns it creates."
arch=(x86_64)
url="https://github.com/tiagolr/sirial"
license=(GPLv3)
groups=(vst3-plugins lv2-plugins)
makedepends=(git)
provides=("${pkgname%-*}")
source=("https://github.com/tiagolr/sirial/releases/download/v1.1.1/sirial-linux-v1.1.1.zip")
sha256sums=('4937c3c27ba4ffe41a76de4d5020ba4923ac828e6916258916fe329335c4aeff')

package() {
  mkdir -p "$pkgdir"/usr/lib/{vst3,lv2}
  cp -r sirial-linux/VST3/* "$pkgdir"/usr/lib/vst3
  cp -r sirial-linux/LV2/* "$pkgdir"/usr/lib/lv2
}
