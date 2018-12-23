# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.8.2
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("$_binary-$pkgver::https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('71dce21fd49c14214d86d40ae0030fdb7e2d4efb7ac619bda954deb448b4abdd')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/fluxctl"
}
