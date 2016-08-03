# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=minikube
pkgver=0.7.1
pkgrel=1
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
makedepends=()

source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha512sums=('a91bb779ab77e98834a375e7c6aacc9cf430b33aa2992290b6a9867addf1a9adc6957cffea3e097deda4bf3eaf22d76776d22253c80325dd3f2f31f726941d05')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube_$pkgver "$pkgdir/usr/bin/minikube"
}
