# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergi Jimenez <sjr@redhat.com>

pkgname=virtctl-bin
_virtctl_version=0.26.5
pkgver=${_virtctl_version//-/_}
pkgrel=1
pkgdesc="CLI tool for managing KubeVirt resources."
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')

source=(https://github.com/kubevirt/kubevirt/releases/download/v${_virtctl_version}/virtctl-v${_virtctl_version}-linux-amd64)
sha256sums=('2dd2b4fc0472da05c2b9820b28fffc7fa6ab2b7f8b195c9c5e3b715abf214876')


package() {
  install -Dm755 "${srcdir}/virtctl-v${_virtctl_version}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
