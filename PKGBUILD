# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=argo-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64')
url="https://github.com/argoproj/argo"
license=('Apache')
source=("argo_$pkgver::https://github.com/argoproj/argo/releases/download/v$pkgver/argo-linux-amd64")
sha256sums=('5d061a6195eaadbee403f0bf5aea3a0951773219656190b426827e535c178993')

package() {
  install -Dm755 "argo_$pkgver" "$pkgdir/usr/bin/argo"
}
