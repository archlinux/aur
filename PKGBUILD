# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.2.1
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_${_name}.v${pkgver}_linux_amd64")
sha256sums=('a91b38778945e8a63fe70bc7522703a94c1d572d5dcee245e96647359e1fd04b')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${_name}.v${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
