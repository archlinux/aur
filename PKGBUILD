# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=argo-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64')
url="https://github.com/argoproj/argo"
license=('Apache')
source=("argo_$pkgver::https://github.com/argoproj/argo/releases/download/v$pkgver/argo-linux-amd64")
sha256sums=('979188b6f42f16494d321c1627acf45e447725c60cb040f9b1f0635619721a92')

package() {
  install -Dm755 "argo_$pkgver" "$pkgdir/usr/bin/argo"
}
