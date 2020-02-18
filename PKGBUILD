# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=argo-bin
pkgver=2.4.3
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64')
url="https://github.com/argoproj/argo"
license=('Apache')
source=("argo_$pkgver::https://github.com/argoproj/argo/releases/download/v$pkgver/argo-linux-amd64")
sha256sums=('28133c3e1cc368b4e7062e8ca2c438b31388d771f0493aa92fef1a96d4fcf63a')

package() {
  install -Dm755 "argo_$pkgver" "$pkgdir/usr/bin/argo"
}
