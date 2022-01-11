# Maintainer: jbpratt <jbpratt78 at gmail dot com>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Sergi Jimenez <sjr at redhat dot com>

pkgname=virtctl-bin
pkgver=0.49.0
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${pkgver}/virtctl-v${pkgver}-linux-amd64")
sha512sums=("eac058f8896222a5c3060e3a197a487fec905f40f1b3f2c22d7dd4eb43d40a077f77985ea0920b7b8c0aa5b133667b8a2b4206a687bc3d1eae35ff5b6592d655")

package() {
  install -Dm755 "${srcdir}/virtctl-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
