# Maintainer: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.13.2
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("kops-linux-amd64-$pkgver::https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha1sums=('e8ebae8a5589cc910e1c478182e0e8de9e784410')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64-$pkgver" "$pkgdir/usr/bin/kops"
}
