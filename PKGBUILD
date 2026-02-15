# Maintainer: Aashish Thapa
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.4
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

sha256sums=('67ede4afa376f604d39ec958b6417d2b522456db6aa062716c87364fc5c86a72')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}
