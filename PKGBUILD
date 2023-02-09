# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=1
pkgrel=1
pkgdesc='Translate TUI in Golang'
url='https://github.com/eeeXun/GTT'
license=('MIT')
source_x86_64=("gtt-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/gtt-linux-amd64.tar.gz")
arch=('x86_64')
depends=('alsa-lib')
optdepends=('xclip: for clipboard support on X11' 'wl-clipboard: for clipboard support on Wayland')
provides=('gtt')
sha256sums_x86_64=('20c9643f1aacf5a8fb2f1564a13d87333fb138867552966e67733f46afcd484d')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
