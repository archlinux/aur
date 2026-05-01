# Maintainer: Aashish Thapa
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.6
pkgrel=1
pkgdesc="TUI for managing WiFi using NetworkManager (a fork of impala)"
arch=("x86_64")
url="https://github.com/aashish-thapa/wlctl"
license=("GPL3")
depends=("networkmanager")
conflicts=("wlctl")
provides=("wlctl")
options=(!strip)

source=(
  "wlctl::https://github.com/aashish-thapa/wlctl/releases/download/v${pkgver}/wlctl-x86_64-unknown-linux-musl"
)

sha256sums=('ee027642a2d76ae3fb191014eff12ec383b71d15b0dd3f1bc7b23fa2d4dfe1a0')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}
