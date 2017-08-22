# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=2.6.0
pkgrel=2
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl-bin: to manage the cluster'
)

source=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('506e477a9eb61730a2fb1af035357d35f9581a4ffbc093b59e2c2af7ea3beb41')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
}
