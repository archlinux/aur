# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.6.0
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('3f826032575d85b1cd094f3a1a52b37e3af617132da627e3b63e6d8924f37352')

package() {
  install -Dm 755 "$srcdir/$_binary" "$pkgdir/usr/bin/fluxctl"
}
