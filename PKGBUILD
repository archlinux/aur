# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kind-bin
pkgdesc="Kubernetes IN Docker - local clusters for testing Kubernetes"
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kind"
license=('apache')
_binary=kind-linux-amd64
source=("$_binary-$pkgver::https://github.com/kubernetes-sigs/kind/releases/download/$pkgver/$_binary")
sha256sums=('4493aaaffb997a07ef15f04ae0ed1b935cd4b648885b79f4fd48977ff4906b8d')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/kind"
}
