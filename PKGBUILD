# Maintainer: Michael Beaumont <mjboamail@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# URL: https://github.com/michaelbeaumont/aur-packages

_name=kustomize
pkgname=kustomize-bin
pkgver=4.4.1
pkgrel=1
pkgdesc="Customization of Kubernetes YAML configurations"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kustomize"
license=('Apache')
provides=('kustomize')
source=("https://github.com/kubernetes-sigs/${_name}/releases/download/${_name}%2Fv${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=(
    '2d5927efec40ba32a121c49f6df9955b8b8a296ef1dec4515a46fc84df158798'
)

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
