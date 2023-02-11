# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=2
pkgrel=2
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('63391a071f3e0e854559889f21ebd1c73cb03416ba82aac2952a4a947e9bae79')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
