# Maintainer Lucas Nikola Pape <lpape at proton dot me>
# Contributor: Dessa Simpson <dxs at k7dxs dot net>
# Contributor: jbpratt <jbpratt78 at gmail dot com>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Sergi Jimenez <sjr at redhat dot com>

pkgname=virtctl-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${pkgver}/virtctl-v${pkgver}-linux-amd64")
sha512sums=('31a0f3ce6fe51ca0f0642d8a2723ccc097c34451a8775dc55bf214e9ef9d0335eaaf4ddced120957cab8591d947477514abcc71289acee9ff00a61f94c1e7c96')

package() {
  install -Dm755 "${srcdir}/virtctl-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
