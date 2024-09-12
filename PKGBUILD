# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
arch=("aarch64" "x86_64")
conflicts=("macchina")
license=("MIT")
optdepends=("wmctrl")
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
pkgname=macchina-bin
pkgrel=1
pkgver=6.2.0
provides=("macchina=${pkgver}")
sha256sums_aarch64=("76a5a9f98bad37e0fc1c33c868d2914e9ec1200865341de7ac9a21248fcc831a")
sha256sums_x86_64=("101b1748ca8aadd497163669d9372b7c3f257d58acf88acabf1016c1df108cf0")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-${arch[0]}.tar.gz::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-v${pkgver}-linux-gnu-${arch[0]}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-${arch[1]}.tar.gz::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-v${pkgver}-linux-gnu-${arch[1]}.tar.gz")
url="https://github.com/macchina-cli/macchina"

package() {
  install -D --mode 755 "${srcdir}/macchina" "${pkgdir}/usr/bin/macchina"
}
