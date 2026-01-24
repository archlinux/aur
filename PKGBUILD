# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=11
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
arch=('x86_64' 'aarch64')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
source_aarch64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-arm64.tar.gz")
sha256sums_x86_64=('06966e3e086d3185af4c6da91164f4b1605c452b74873425b7ead52646ae9976')
sha256sums_aarch64=('4488c6247001f4ee09323f678eb78cf6271bd779a468e98b8f400271aa532198')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
