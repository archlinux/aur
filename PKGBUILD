# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=5
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('d5c9347eeee65868c8f4d1ba4d3199c10e6085b121d9cf1e22cc6d9a5ca981ee')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
