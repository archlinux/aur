# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('12296b93536e435d32edb42e4604eef977cd62a2225a3933d3ee86cf2ee48c41')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
