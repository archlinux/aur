# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kube-aws
pkgver=v0.9.8
pkgrel=1
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/kube-aws"
license=('Apache')
makedepends=()
source=("${url}/releases/download/${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('fd1c9825b3e52c3eb021830d8b2d687f61f871ad1b9ae366d2f43b5c78f1575970cb7da1939c0d338c92d701599cbd46e02dc981ec135f02aace848f2d99a79c')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
