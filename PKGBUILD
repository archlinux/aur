# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Giacomo Longo <gabibbo97@gmail.com>

pkgname=kubebuilder
pkgver=2.3.1
pkgrel=3
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ff496970f209706763f2aba2bdcefc2de8d00085b3b972b5790117b59ea4ed10')
arch=('x86_64')

package() {
  mkdir -p "$pkgdir/usr/local/kubebuilder"
  rsync -av "$srcdir/kubebuilder_${pkgver}_linux_amd64/" "$pkgdir/usr/local/kubebuilder/"
}
