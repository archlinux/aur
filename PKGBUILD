# Maintainer: Aashish Thapa
pkgname=lanscope-bin
_pkgname=lanscope
pkgver=0.1.2
pkgrel=1
pkgdesc="Passive eBPF-powered IoT device fingerprinting & anomaly detection for your LAN"
arch=("x86_64")
url="https://github.com/aashish-thapa/lanscope"
license=("MIT" "Apache")
conflicts=("lanscope")
provides=("lanscope")
options=(!strip)

source=(
  "lanscope::https://github.com/aashish-thapa/lanscope/releases/download/v${pkgver}/lanscope-x86_64-unknown-linux-musl"
)

sha256sums=('22a1aab3671ea3950a1b8dc609a6c24b3ffc5681d36f74da265721697e67a8c7')

package() {
  install -Dm755 lanscope "${pkgdir}/usr/bin/lanscope"
}
