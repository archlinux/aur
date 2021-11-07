# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages

_name=kustomize
pkgname=kustomize-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
provides=('kustomize')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=(
    'bf3a0d7409d9ce6a4a393ba61289047b4cb875a36ece1ec94b36924a9ccbaa0f'
)

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
