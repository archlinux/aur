# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergi Jimenez <sjr@redhat.com>

pkgname=virtctl-bin
_virtctl_version=0.30.2
pkgver=${_virtctl_version//-/_}
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${_virtctl_version}/virtctl-v${_virtctl_version}-linux-amd64")
sha512sums=('59d8b9b5586b8c5d407e714885cd93d4e473a61ff6c96d86a0a40d94b1df27cdc2ca1d47f01871074e5a828ce7da945e5e533afa1db1076397c0263b429f2e86')

package() {
  install -Dm755 "${srcdir}/virtctl-v${_virtctl_version}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
