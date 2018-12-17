# Maintainer: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.10.0
pkgrel=2
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("kops-linux-amd64-$pkgver::https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha1sums=('aaa34a80e7e24104fd90f9c2571b37fa7c0b3284')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64-$pkgver" "$pkgdir/usr/bin/kops"
}
