# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages

_name=kustomize
pkgname=kustomize-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
provides=('kustomize')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('9d5b68f881ba89146678a0399469db24670cba4813e0299b47cb39a240006f37')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
