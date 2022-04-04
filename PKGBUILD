# Maintainer: Jose Cardoso <archlinux dot org at josecardoso dot com>
arch=("aarch64" "x86_64")
conflicts=("macchina")
license=("MIT")
optdepends=("wmctrl")
pkgdesc="A system information fetcher/frontend, with an (unhealthy) emphasis on performance"
pkgname=macchina-bin
pkgrel=1
pkgver=6.0.6
provides=("macchina=${pkgver}")
sha256sums_aarch64=("8eb6f8c42fed0bdf950f52d9eae1d15022812e66da2bed08f8ac2052772d3ec1")
sha256sums_x86_64=("0a5bc95c22ed31035f4e905c75124062c3e8501199005f7f181e7c6f0ea77113")
source_aarch64=("https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-aarch64")
source_x86_64=("https://github.com/macchina-cli/macchina/releases/download/v${pkgver}/macchina-linux-x86_64")
url="https://github.com/macchina-cli/macchina"

package() {
  install -Dm 755 "$srcdir/macchina-linux-${CARCH}" "$pkgdir/usr/bin/macchina"
}
