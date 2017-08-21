# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl-bin: to manage the cluster'
)

source=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('0568604d7a7adf6363d6dc367b19a69c23d3a2b5de15bac1c41317ce7ba76491')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
}
