# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('18cae5f2f789cb1df1d9822d9a290642c43cc54e46398aa636ef56d6769be733')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
}
