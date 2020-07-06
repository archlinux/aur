# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Elliott <contact@zell.io>

pkgname=kube-aws
pkgver=0.16.2
pkgrel=2
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/kube-aws"
license=('Apache')
makedepends=()
source=("${url}/releases/download/v${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('f76b1c01f6c5d54defd30e9a79260cd292b63e9f222e826804a24350ff8bd94832f9e5d5a48e2c1b2e891bc24113de1fa2057302f1fd3f32488de2c3aa898e59')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
