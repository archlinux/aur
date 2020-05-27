# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=kube-capacity
_pkgname=kube-capacity
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple CLI that provides an overview of the resource requests, limits, and utilization in a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/robscott/kube-capacity"
source=("https://github.com/robscott/kube-capacity/releases/download/$pkgver/kube-capacity_"$pkgver"_Linux_x86_64.tar.gz")
sha256sums=('5784b819447d823d29622084d86d2e5eca51f7c1c016db0ae17457a7d24c6cd1')
options=(!strip)
arch=('x86_64')
license=('Apache-2.0')

package() {
  install -Dm 755 "$srcdir/kube-capacity" "$pkgdir/usr/bin/kube-capacity"
}
