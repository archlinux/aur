# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=7
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/gtt'
license=('MIT')
source_x86_64=("gtt-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('020dfb051008d15b2810d1d7e430154efa7404bc2287dab19430129ef4ccf3dc')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
