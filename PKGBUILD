# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('f186759409f7a3fe6ea6633b8d14ead7b16815b84981ba79fc1dd048f77d7f45')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
}
