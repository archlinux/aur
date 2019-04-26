# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.12.1
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("$_binary-$pkgver::https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('364e0a94977ee8ab56b966b01b31513af827f87f80b247f109de793ad4da935d')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/fluxctl"
}
