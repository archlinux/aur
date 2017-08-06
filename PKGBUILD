# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.7.0
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha512sums=('0343e8a4edce6e5277738f8541ac91817e6d442afae31a73e4bbe81aa67bdfd954564128eee8ef617de97c93c7d74eba5a22a9e6705a33d6987ac1a1e54c767f')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64" "$pkgdir/usr/bin/kops"
}
