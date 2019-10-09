# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.2.3
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_${_name}.v${pkgver}_linux_amd64")
sha256sums=('77e4615f47cc1149873bd9ab398d48fec245812dfe391ff9a73193fb9a65df97')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_${_name}.v${pkgver}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
