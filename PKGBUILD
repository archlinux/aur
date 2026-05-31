# Maintainer: Aashish Thapa
pkgname=lanscope-bin
_pkgname=lanscope
pkgver=0.1.0
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

sha256sums=('17f82f34cfeec45bb83518fa33717e374aac293601e1a98da7a2c7b4078a8518')

package() {
  install -Dm755 lanscope "${pkgdir}/usr/bin/lanscope"
}
