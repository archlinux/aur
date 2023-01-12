# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
arch=("aarch64" "x86_64")
conflicts=("macchina")
license=("MIT")
optdepends=("wmctrl")
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
pkgname=macchina-bin
pkgrel=1
pkgver=6.1.8
provides=("macchina=${pkgver}")
sha256sums_aarch64=("6505d0519504a8ec0ab7f343d7772cdf206631acc1a433264cb8bce018dcd2ec")
sha256sums_x86_64=("e01ccb9b856df09abd449c8239903082e2b311cd51e13feb432c65e7965def92")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-${arch[0]}::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-${arch[0]}")
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-${arch[1]}::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-${arch[1]}")
url="https://github.com/macchina-cli/macchina"

package() {
  install -D --mode 755 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}" "${pkgdir}/usr/bin/macchina"
}
