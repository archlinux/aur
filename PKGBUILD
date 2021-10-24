# Maintainer: jbpratt <jbpratt78 at gmail dot com>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Sergi Jimenez <sjr at redhat dot com>

pkgname=virtctl-bin
_virtctl_version=0.46.1
pkgver=${_virtctl_version//-/_}
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${_virtctl_version}/virtctl-v${_virtctl_version}-linux-amd64")
sha512sums=('a0ba1ef015586afdd55c01958d9fe707b2b5b26070c74c8a29154ba9df81c01b17789331d78f77c9b80ff26cdb01a67eda561cc8d64e32ef8fd5755565d99658')

package() {
  install -Dm755 "${srcdir}/virtctl-v${_virtctl_version}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
