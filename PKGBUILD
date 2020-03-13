# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=argo-bin
pkgver=2.6.2
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64')
url="https://github.com/argoproj/argo"
license=('Apache')
source=("argo_$pkgver::https://github.com/argoproj/argo/releases/download/v$pkgver/argo-linux-amd64")
sha256sums=('9867dd272d376ffae26d80b98710b69c71d858d60ec391760fa5faa08954ebe4')

package() {
  install -Dm755 "argo_$pkgver" "$pkgdir/usr/bin/argo"
}
