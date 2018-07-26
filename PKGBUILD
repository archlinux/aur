# Maintainer: Sergi Jimenez <sjr@redhat.com>

pkgname=virtctl-bin
_virtctl_version=0.7.0
pkgver=${_virtctl_version//-/_}
pkgrel=1
pkgdesc="Tool for managing KubeVirt resources."
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('virtctl')

source=(https://github.com/kubevirt/kubevirt/releases/download/v${_virtctl_version}/virtctl-v${_virtctl_version}-linux-amd64)
sha256sums=('482e9d928dfd44c09f5bfd9b9698dd88e4f24cc681543c36e4bfa3ff7bbdd4db')


package() {
  install -Dm755 "${srcdir}/virtctl-v${_virtctl_version}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
