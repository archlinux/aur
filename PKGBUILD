# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kops
pkgver=v1.4.1
pkgrel=1
pkgdesc="Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management"
arch=('x86_64')
url="https://github.com/kubernetes/kops"
license=('Apache')
makedepends=()

source=("https://github.com/kubernetes/kops/releases/download/${pkgver}/kops-linux-amd64")
sha512sums=('9f182c5278a6b077ac50a05f070cd7969e77fa4d02c1ab13c1ca692175a6a221b405659e91f7b22322671dc19923ae3acd1b45993ac7f50bf6c2d0f7f132800c')

package() {
	install -D -g root -m 0755 -o root "$srcdir/kops-linux-amd64" "$pkgdir/usr/bin/kops"
}
