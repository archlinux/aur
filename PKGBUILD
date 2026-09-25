# Maintainer: eeeXun <sdes96303@gmail.com>

pkgname=gtt-bin
pkgver=12
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
sha256sums_x86_64=('fd88e12363af02e062c031f2ad2ef0ef481ef50d3ca23f0763e1d0fc2e0fe05f')
sha256sums_aarch64=('80c92948fe59f598a006d6265a3b8060580e0098ba9bf9c0e5f981424a4d400e')

package() {
  install -Dm755 "gtt" "$pkgdir/usr/bin/gtt"
}
