# Maintainer Lucas Nikola Pape <lpape at proton dot me>
# Contributor: Dessa Simpson <dxs at k7dxs dot net>
# Contributor: jbpratt <jbpratt78 at gmail dot com>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Sergi Jimenez <sjr at redhat dot com>

pkgname=virtctl-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${pkgver}/virtctl-v${pkgver}-linux-amd64")
sha512sums=('18a011fe24c5607d64eefd80c00320c41370a96480ea7d4489a35e1ebd4e2ab3713fd67fa7efba9e9220ea6d35417e35de057affee9d1a1c5df9865159da5074')

package() {
  install -Dm755 "${srcdir}/virtctl-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
