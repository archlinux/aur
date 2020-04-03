# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.19.0
pkgrel=1
arch=('x86_64')
url="https://github.com/fluxcd/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("$_binary-$pkgver::https://github.com/fluxcd/flux/releases/download/$pkgver/$_binary")
sha256sums=('0e5855ec75eb64340967ea893127a794f0473509c123c16fb251cc6410cfcb7f')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/fluxctl"
}
