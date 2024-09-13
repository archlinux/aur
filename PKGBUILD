# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
arch=("aarch64" "x86_64")
conflicts=("macchina")
license=("MIT")
optdepends=("wmctrl")
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
pkgname=macchina-bin
pkgrel=1
pkgver=6.2.1
provides=("macchina=${pkgver}")
sha256sums_aarch64=("a2c3d0f7e16b10155bfaff045c376cf4ea2c77c1e1f95145f5ce7a021aa79b2b")
sha256sums_x86_64=("80b7cbc14b0448ec54072cf3d366e373175d59ae7dc3687a3ad8f1eaa0ad6275")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-${arch[0]}.tar.gz::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-v${pkgver}-linux-gnu-${arch[0]}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-${arch[1]}.tar.gz::https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-v${pkgver}-linux-gnu-${arch[1]}.tar.gz")
url="https://github.com/macchina-cli/macchina"

package() {
  install -D --mode 755 "${srcdir}/macchina" "${pkgdir}/usr/bin/macchina"
}
