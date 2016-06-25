# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=minikube
pkgver=0.3.0
pkgrel=1
pkgdesc="Minikube is a tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
makedepends=()

source=(minikube::https://storage.googleapis.com/minikube/releases/v0.3.0/minikube-linux-amd64)
sha512sums=('6ef86da03ee7ce412af288d11faed2c37710bcd9f00aa4aa0b643d72fbe061941d89eef9f10df00d26c0744c61870fde4ac02514e2cb78ef0925d725f974d94e')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 minikube "$pkgdir/usr/bin/minikube"
}
