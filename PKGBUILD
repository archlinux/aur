# Maintainer: Ryan Eschinger <ryan[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=0.12.3
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('35c948cc0caac9bb2708913b5694b6c84498fdf17d2cbec58c45ce60d69c5040')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
}
