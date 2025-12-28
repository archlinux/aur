
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.3
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

sha256sums=('124fc6461675d1d3abdd3e984aebeb02868c32639bfcd7e4defb3b1df175d56e')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}

