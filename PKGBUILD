# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.13.3
pkgrel=1
arch=('x86_64')
url="https://github.com/fluxcd/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("$_binary-$pkgver::https://github.com/fluxcd/flux/releases/download/$pkgver/$_binary")
sha256sums=('08d313f1812d097ffb3e1ce56c9d9e7a2e8c7af54db4e4a8542d316bbaaf7722')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/fluxctl"
}
