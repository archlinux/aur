# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=argocd-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("argocd_$pkgver::https://github.com/argoproj/argo-cd/releases/download/v$pkgver/argocd-linux-amd64")
sha256sums=('9d642f44958717d8e827af1599366e251cdbe83238feeb1fc92059b0417b790a')

package() {
  install -Dm755 "argocd_$pkgver" "$pkgdir/usr/bin/argocd"
}
