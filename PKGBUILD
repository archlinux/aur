# Maintainer: cLLeB <kyereboatengcaleb@gmail.com>
pkgname=gear-terminal-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="AI-native developer terminal built on Tauri and Rust"
arch=('x86_64')
url="https://gear.kyere.me"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('gear-terminal')
conflicts=('gear-terminal')
source_x86_64=("https://github.com/cLLeB/gear/releases/download/v${pkgver}/Gear_${pkgver}_amd64.deb")
sha256sums_x86_64=('de38afa2fbf366755dfca47e8d4985321120e95a75dd4109518be79159216c7e')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.zst -C "$pkgdir/"
}
