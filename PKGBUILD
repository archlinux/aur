# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl-bin: to manage the cluster'
)

source=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('5a106eb569d873669adacba28ff8297293200bd6dc67b379af61027eb05b6118')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
}
