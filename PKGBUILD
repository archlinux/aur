# Maintainer: Sergi Jimenez <sjr@redhat.com>

pkgname=virtctl-bin
_virtctl_version=0.23.2
pkgver=${_virtctl_version//-/_}
pkgrel=1
pkgdesc="CLI tool for managing KubeVirt resources."
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('virtctl')

source=(https://github.com/kubevirt/kubevirt/releases/download/v${_virtctl_version}/virtctl-v${_virtctl_version}-linux-amd64)
sha256sums=('e1f2547326cbf52150bcf40af5960bc91f3581b67f10728c8d3b61354a444921')


package() {
  install -Dm755 "${srcdir}/virtctl-v${_virtctl_version}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
