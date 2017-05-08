# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.5.3
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha512sums=('725916570633c986d16bd4075c3b3a4d3c2b29f661a96676f2cb7bd0505f5840a4c397098b66923208bd21d099f1a08d1acab806173b0199801c446e57cffcda')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64" "$pkgdir/usr/bin/kops"
}
