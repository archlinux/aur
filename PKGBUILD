# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=kustomize
pkgname=kustomize-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('4b49e1bbdb09851f11bb81081bfffddc7d4ad5f99b4be7ef378f6e3cf98d42b6')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
