# Maintainer: cLLeB <kyereboatengcaleb@gmail.com>
pkgname=gear-terminal-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="AI-native developer terminal built on Tauri and Rust"
arch=('x86_64')
url="https://github.com/cLLeB/gear"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('gear-terminal')
conflicts=('gear-terminal')
source_x86_64=("https://github.com/cLLeB/gear/releases/download/v${pkgver}/Gear_${pkgver}_amd64.deb")
sha256sums_x86_64=('df6d085fe255c5e70e57b240a2722e3a77a79214f5e86c9449947901386455b0')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.zst -C "$pkgdir/"
}
