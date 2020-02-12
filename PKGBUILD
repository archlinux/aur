# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=tanka-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Flexible, reusable and concise configuration for Kubernetes"
arch=('x86_64')
url="https://github.com/grafana/tanka"
license=('Apache')
source=("https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")
sha256sums=('d37bc10c4dda8a7f961ffda5a24b8a5ac29b93030570e46b1f31c6506dd38eab')

package() {
  install -Dm 755 "$srcdir/tk-linux-amd64" "$pkgdir/usr/bin/tk"
}
