# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=10
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('9d92c049b343b054902273915264fa5c9082c3e02a0d8b974856398c79a2d846')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
