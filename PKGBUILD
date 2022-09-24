# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
arch=("aarch64" "x86_64")
conflicts=("macchina")
license=("MIT")
optdepends=("wmctrl")
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
pkgname=macchina-bin
pkgrel=1
pkgver=6.1.5
provides=("macchina=${pkgver}")
sha256sums_aarch64=("09274b8220530c5e860727dcce5f8ab8e88205700eb99f43f1eea7ef905e4052")
sha256sums_x86_64=("aa0da22a13324b700383c1bfc1ea33216cdc8cc9f57c8186651caa0e2e49761e")
source_aarch64=("https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-aarch64")
source_x86_64=("https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-x86_64")
url="https://github.com/macchina-cli/macchina"

package() {
  install -Dm 755 "$srcdir/macchina-linux-${CARCH}" "$pkgdir/usr/bin/macchina"
}
