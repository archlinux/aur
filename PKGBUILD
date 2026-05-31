# Maintainer: Aashish Thapa
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.7
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

sha256sums=('db5a90eb539a7a2864974d5dd7d8612da9eb3b8040eb8b8f3a1c1182915ea1fd')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}
