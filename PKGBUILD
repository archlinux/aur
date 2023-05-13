# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=6
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('6de8659a59e6bc19c79643be4b17b80a5ebaa6fcd1ce14c127345c7075e63e5d')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
