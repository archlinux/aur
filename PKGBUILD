# Maintainer: Aashish Thapa
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.5
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

sha256sums=('4c071c9eb1cac2f44734837bbc40095dd3f11c7f4d18619bb929e701d168fb5c')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}
