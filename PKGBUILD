# Maintainer: Justin Hung <hugh.12345zxcvb@gmail.com>

pkgname=kube-capacity-git
_pkgname=kube-capacity-git
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple CLI that provides an overview of the resource requests, limits, and utilization in a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/robscott/kube-capacity"
source=("https://github.com/robscott/kube-capacity/releases/download/v$pkgver/kube-capacity_"$pkgver"_Linux_x86_64.tar.gz")
sha256sums=('138d02b0a49db5fe1aa3bdb5bae58e452d72d92ac22e5bc336175720634821b6')
options=(!strip)
arch=('x86_64')
license=('Apache-2.0')

package() {
  install -Dm 755 "$srcdir/kube-capacity" "$pkgdir/usr/bin/kube-capacity"
}
