# Maintainer: Sergi Jimenez <sjr@redhat.com>

pkgname=virtctl-bin
_virtctl_version=0.8.0
pkgver=${_virtctl_version//-/_}
pkgrel=1
pkgdesc="CLI tool for managing KubeVirt resources."
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('virtctl')

source=(https://github.com/kubevirt/kubevirt/releases/download/v${_virtctl_version}/virtctl-v${_virtctl_version}-linux-amd64)
sha256sums=('080c50c90b9f11a7ca81cd6e8226bae6c09ee56289b58cc9a6837d735abd941d')


package() {
  install -Dm755 "${srcdir}/virtctl-v${_virtctl_version}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
