# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kube-aws
pkgver=v0.8.1
pkgrel=1
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/coreos-kubernetes"
license=('Apache')
makedepends=()

source=("https://github.com/coreos/coreos-kubernetes/releases/download/${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('d64d21b93e9ed38af9dc0b6141631087921292e947231c651f359a37c0c9ead609dfa44a299b6269c5a9c7b468c1d9593fe19a05527851f0da64c98235f2219f')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
