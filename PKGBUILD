# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=tanka-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Flexible, reusable and concise configuration for Kubernetes"
arch=('x86_64')
url="https://github.com/grafana/tanka"
license=('Apache')
source=("https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")
sha256sums=('3b378ecb362a3259ed7a7db311b106fdced48ac4019bc492118973a66daac364')

package() {
  install -Dm 755 "$srcdir/tk-linux-amd64" "$pkgdir/usr/bin/tk"
}
