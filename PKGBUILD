# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.12.3
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
_binary=fluxctl_linux_amd64
source=("$_binary-$pkgver::https://github.com/weaveworks/flux/releases/download/$pkgver/$_binary")
sha256sums=('4df1e18b8a6a9907fd24bcf6dc5482c5bca38064b2ed49b593d03bf5d2c04402')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/fluxctl"
}
