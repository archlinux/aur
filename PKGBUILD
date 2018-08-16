# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.5.0
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('f630dea4ee8fab565b4bbd72aa0cd23be9bf676fec2f0670cd238ab198b9ba71')

package() {
  install -Dm 755 "$srcdir/$_binary" "$pkgdir/usr/bin/fluxctl"
}
