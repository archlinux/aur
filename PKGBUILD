# Maintainer: Olivia Mackintosh <liv@base.nu>

pkgname=shortcircuit-xt-bin
pkgver=2026.05.22.2775946
pkgrel=1
pkgdesc="Shortcircuit XT is a modern open source software sampler focused on workflow, expressive modulation, and deep sample playback control."
arch=(x86_64)
url="https://surge-synth-team.org/shortcircuit-xt/"
license=(MIT)
groups=(clap-plugins vst3-plugins)
makedepends=()
provides=("${pkgname%-*}")
source=("https://github.com/surge-synthesizer/shortcircuit-xt/releases/download/Nightly/shortcircuit-xt-linux-2026-05-22-2775946.zip")
sha256sums=('b8893094e1db89492f03e4cbbcc8f0932d72d63410f98e2d958455fe754a761f')

package() {
  mkdir -p "$pkgdir"/usr/lib/{clap,vst3}
  cp -r "shortcircuit-products/Shortcircuit XT.vst3" "$pkgdir"/usr/lib/vst3/
  cp "shortcircuit-products/Shortcircuit XT.clap" "$pkgdir"/usr/lib/clap/
}
