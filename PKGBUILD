# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.6.0
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha512sums=('4263e0a2dc69795cbae0b781ec2fa552fb941f3f443f1216b996f9d0bc1b577c0b090124ad4584f87db2e2fdab7f5bdcdb9162b154bebaa71753e660fff94f11')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64" "$pkgdir/usr/bin/kops"
}
