# Maintainer: Muhkoenig

pkgname=kubernetes-helm-bin
pkgver=2.8.0
pkgrel=2
pkgdesc="The Kubernetes Package Manager"
url="https://github.com/kubernetes/helm"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl-bin: to manage the cluster'
)

source=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha256sums=('6e1f5957f9c7cec8463f38cf658bea0cf225fc324236617b23fe9044e9dd4ba7')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 linux-amd64/helm "$pkgdir/usr/bin/helm"
}
