# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=vitsel-clap-bin
_pkgname=vitsel
pkgver=0.7.4
pkgrel=1
pkgdesc="Minimal Rust CLAP synth with PolyBLEP oscillators, ADSR, and zero-delay TPT SVF"
arch=('x86_64')
url="https://github.com/mlm-games/vitsel-clap"
license=('MIT')
depends=('glibc')
optdepends=('clap-host: A CLAP host to load the plugin (not required by yadaw)')
provides=('vitsel-clap')
conflicts=('vitsel-clap')
options=('!strip')

source=("Vitsel-${pkgver}.clap::https://github.com/mlm-games/vitsel-clap/releases/download/v${pkgver}/Vitsel-linux.clap")
sha256sums=('cba17e8ae134e2a046b23d154d05e589add7093b1641f3a888370b1b0c0d53c5')

package() {
  install -Dm755 "${srcdir}/Vitsel-${pkgver}.clap" \
    "${pkgdir}/usr/lib/clap/Vitsel.clap"
}
