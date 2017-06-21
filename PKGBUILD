# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=1.6.2
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha512sums=('a09f44c4d0e4ab0791f68a12493c690d54afde97413b8fcb4c6609f5a0605683637f328f573725ba04fc35818f2fbb85cb8f71462ca756191b7adf7fa0b8dab2')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64" "$pkgdir/usr/bin/kops"
}
