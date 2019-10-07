# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_${_name}.v${pkgver}_linux_amd64")
sha256sums=('c25c41d2295326d0af7c2613ff9d0ce7d3432dfc7a6426da6242213a1fd60e0e')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${_name}.v${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
