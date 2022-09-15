# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
arch=("aarch64" "x86_64")
conflicts=("macchina")
license=("MIT")
optdepends=("wmctrl")
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
pkgname=macchina-bin
pkgrel=1
pkgver=6.1.1
provides=("macchina=${pkgver}")
sha256sums_aarch64=("294893db128e319196f34fc99a718d470427fee278063ee43e4b85e4742e317f")
sha256sums_x86_64=("b8e589b5ffe5cb4e12f6f7f393d4bb65b244a0123917eedaa50adc87308ce83f")
source_aarch64=("https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-aarch64")
source_x86_64=("https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-x86_64")
url="https://github.com/macchina-cli/macchina"

package() {
  install -Dm 755 "$srcdir/macchina-linux-${CARCH}" "$pkgdir/usr/bin/macchina"
}
