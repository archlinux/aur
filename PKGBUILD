# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=9
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('169d890158771cb5ca557aadfc19e0b824f0c5e8ded2e76924808adfda8824b7')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
