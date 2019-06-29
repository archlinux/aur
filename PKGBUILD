# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64")
sha256sums=('f12b81585fc70970c16cf8c9f9032c17fdbada288b500740bc001806fdce2f80')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
