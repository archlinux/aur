# Maintainer: Zachary Elliott <contact@zell.io>
# https://github.com/zellio/pkgbuild

pkgname=kube-aws
pkgver=v0.9.6
pkgrel=1
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/kube-aws"
license=('Apache')
makedepends=()
source=("${url}/releases/download/${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('b4796e8b4c582f69bd4e6f52a4658022ad2390fd0fd2b6896a476de2b0396827ea405b34f3cec61c0b78dac46a4985943e60dcf78dd0d075a1fc6de637369d38')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
