# Maintainer: Aashish Thapa
pkgname=flockssh-bin
_pkgname=flockssh
pkgver=0.1.0
pkgrel=1
pkgdesc="Zero-config SSH fleet TUI for embedded/IoT Linux devices (discover the LAN, track by MAC, connect with one key)"
arch=("x86_64")
url="https://github.com/aashish-thapa/flock"
license=("MIT")
depends=("openssh")
conflicts=("flockssh")
provides=("flockssh")
options=(!strip)

source=(
  "flockssh::https://github.com/aashish-thapa/flock/releases/download/v${pkgver}/flockssh-x86_64-unknown-linux-musl"
)

sha256sums=('48f9082388e650d28a7e4b9a9cd31c1b8013e97ea6df20a6f4e73805400300d8')

package() {
  install -Dm755 flockssh "${pkgdir}/usr/bin/flockssh"
}
