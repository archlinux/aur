# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kube-aws
pkgver=v0.9.1
pkgrel=1
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/kube-aws"
license=('Apache')
makedepends=()
source=("${url}/releases/download/${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('9ab5c36812086367d5050eb9535ea7dca51b514b7c812428a85aa36861b43c2077f08f2f00890fa9974e916881712e4005b9f57655a333519f17dcf49fec8427')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
