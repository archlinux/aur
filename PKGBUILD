# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64")
sha256sums=('7fb7e538e4c48749d3a5972f338158f3aab1579f24bb7481d9d813f9c049b17b')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
