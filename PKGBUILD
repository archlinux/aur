
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.2
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

sha256sums=('6fc316e55c0865efb985db27bc7496c2e9f12b09e107237f55ebca8344a7a5bd')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}

