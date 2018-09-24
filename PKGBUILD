# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.7.0
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('cbcf996f32aef3b9c48b4c48aa7281e88b970eb24e2e208ccfcaf0a51a35b832')

package() {
  install -Dm 755 "$srcdir/$_binary" "$pkgdir/usr/bin/fluxctl"
}
