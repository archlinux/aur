# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=tanka-bin
pkgver=0.7.1
pkgrel=2
pkgdesc="Flexible, reusable and concise configuration for Kubernetes"
arch=('x86_64')
url="https://github.com/grafana/tanka"
license=('Apache')
source=("https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")
sha256sums=('b122aa39b3e6090d82559284fe2bb7a36463fa02e254bccc40be205ebef34740')

package() {
  install -Dm 755 "$srcdir/tk-linux-amd64" "$pkgdir/usr/bin/tk"
}
