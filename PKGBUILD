# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages

_name=kustomize
pkgname=kustomize-bin
pkgver=4.0.1
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
provides=('kustomize')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('914c006a4c00e92e09c050e5be594ef1270d47ea41b84dd7bdcab6b3b05b9297')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
