# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Elliott <contact@zell.io>

pkgname=kube-aws
pkgver=v0.16.1
pkgrel=1
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/kube-aws"
license=('Apache')
makedepends=()
source=("${url}/releases/download/${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('281bf024822b0861401e5959c507e999729df28505aedecfa6de73f98f0163b420720286dbd4444d7d73033018f3a611675b2e998689fd466740b73a963e2926')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
