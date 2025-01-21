# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=tunein-cli
pkgver=0.2.6
pkgrel=1
pkgdesc="Browse and listen to thousands of radio stations across the globe right from your terminal 🌎 📻 🎵✨"
arch=('x86_64')
url="https://github.com/tsirysndr/tunein-cli"
source=("$url/releases/download/v${pkgver/_/-}/tunein_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('536fb0d66aab9d6305b6ce2e0d588e59c3d486e9a6cb49379d3ad0da05ce8ff5')
depends=('alsa-lib')
license=('MIT')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  tar xvf "${srcdir}/tunein_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
}