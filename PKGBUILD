# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Elliott <contact@zell.io>

pkgname=kube-aws
pkgver=v0.15.2
pkgrel=1
pkgdesc="CLI tool to automate Kubernetes cluster deployment to AWS"
arch=('x86_64')
url="https://github.com/coreos/kube-aws"
license=('Apache')
makedepends=()
source=("${url}/releases/download/${pkgver}/kube-aws-linux-amd64.tar.gz")
sha512sums=('d8abdf6b7e7eecc51a6592420f25068e7c348a88ba4a45403bd660de3dbf9b043abcc1ad78090b372fd10f094b6071be04eb2f5c632faaed4fc399eb91d1ba00')

package() {
	install -D -g root -m 0755 -o root "$srcdir/linux-amd64/kube-aws" "$pkgdir/usr/bin/kube-aws"
}
