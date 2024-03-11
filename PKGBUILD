# Maintainer: Justin Hung <hugh.12345zxcvb@gmail.com>

pkgname=kube-capacity-bin
_pkgname=kube-capacity-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple CLI that provides an overview of the resource requests, limits, and utilization in a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/robscott/kube-capacity"
source=("https://github.com/robscott/kube-capacity/releases/download/v$pkgver/kube-capacity_v"$pkgver"_linux_x86_64.tar.gz")
sha256sums=('610ce6e5d7f528df1c60d3b5e277d00ac43cdfd9ce4d36f0b3132bb68fc12cf3')
options=(!strip)
arch=('x86_64')
license=('Apache-2.0')

package() {
  install -Dm 755 "$srcdir/kube-capacity" "$pkgdir/usr/bin/kube-capacity"
}
