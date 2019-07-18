# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64")
sha256sums=('dc361f59990b09a7794a32e6c2bf4a23501ed4830231af2d1186808ea6a7ccfd')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
