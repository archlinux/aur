# Maintainer: Aashish Thapa
pkgname=wlctl-bin
_pkgname=wlctl
pkgver=0.1.9
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

sha256sums=('5b9532a63d87ca7a3790c5f3c6f9a1c727e92321b7e7089c9e034c649210e903')

package() {
  install -Dm755 wlctl "${pkgdir}/usr/bin/wlctl"
}
