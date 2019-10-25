# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.15.0
pkgrel=1
arch=('x86_64')
url="https://github.com/fluxcd/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("$_binary-$pkgver::https://github.com/fluxcd/flux/releases/download/$pkgver/$_binary")
sha256sums=('d6ca90f6edaf5a770127ceb8fca63e1eafc2bfff8e382df255ffe16dce4fd099')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/fluxctl"
}
