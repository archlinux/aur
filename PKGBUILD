# Maintainer: cLLeB <kyereboatengcaleb@gmail.com>
pkgname=gear-terminal-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="AI-native developer terminal built on Tauri and Rust"
arch=('x86_64')
url="https://gear.kyere.me"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('gear-terminal')
conflicts=('gear-terminal')
source_x86_64=("https://github.com/cLLeB/gear/releases/download/v${pkgver}/Gear_${pkgver}_amd64.deb")
sha256sums_x86_64=('91b955e3c0a0dc86ecef4ae794edcba61a9884521b97647735b0c0b1c44abd6d')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.zst -C "$pkgdir/"
}
