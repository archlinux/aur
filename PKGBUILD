# Maintainer: Aashish Thapa
pkgname=lanscope-bin
_pkgname=lanscope
pkgver=0.1.1
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

sha256sums=('fa0a4e1d8243795f48be5304156e051f3668e0d5707ec6e460de09a48bcdd65a')

package() {
  install -Dm755 lanscope "${pkgdir}/usr/bin/lanscope"
}
