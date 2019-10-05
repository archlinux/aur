# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('91158dc194356ec655c189f44e6212ce11d2ea57d61d31014c130cd46aba6c1f')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
}
