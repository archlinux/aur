# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=argo-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64')
url="https://github.com/argoproj/argo"
license=('Apache')
source=("argo_$pkgver::https://github.com/argoproj/argo/releases/download/v$pkgver/argo-linux-amd64")
sha256sums=('5a912a333e686403cff3c6ed78ed7db5475b69a8680c578f07dc5072eadd1cd0')

package() {
  install -Dm755 "argo_$pkgver" "$pkgdir/usr/bin/argo"
}
