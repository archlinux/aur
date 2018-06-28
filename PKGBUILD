# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.4.1
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('b2af9d1e04c553c1179e1bc4e8e96f6c3fbca170022fb9ef176f9bdf544809cd')

package() {
  install -Dm 755 "$srcdir/$_binary" "$pkgdir/usr/bin/fluxctl"
}
