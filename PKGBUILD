# Maintainer: PolJak <polesnik.jaka@gmail.com>

pkgname=curd-polland-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc. Uses PolLand visual configs for rofi."
arch=('x86_64' 'aarch64')
url="https://github.com/Pol-Jak-295/curd-polland"
license=('GPL3')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd-polland')
conflicts=('curd-polland')
source_x86_64=("https://github.com/Pol-Jak-295/curd-polland/releases/download/v${pkgver}/curd-linux-x86_64")
source_aarch64=("https://github.com/Pol-Jak-295/curd-polland/releases/download/v${pkgver}/curd-linux-arm64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "$srcdir/curd-linux-${CARCH}" "$pkgdir/usr/bin/curd"
}
