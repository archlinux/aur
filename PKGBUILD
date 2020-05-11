# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages

_name=kustomize
pkgname=kustomize-bin
pkgver=3.5.5
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
provides=('kustomize')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('23306e0c0fb24f5a9fea4c3b794bef39211c580e4cbaee9e21b9891cb52e73e7')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
