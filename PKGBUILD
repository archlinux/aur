# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64")
sha256sums=('7db89e32575d81393d5d84f0dc6cbe444457e61ce71af06c6e6b7b6718299c22')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
