# Maintainer Lucas Nikola Pape <lpape at proton dot me>
# Contributor: Dessa Simpson <dxs at k7dxs dot net>
# Contributor: jbpratt <jbpratt78 at gmail dot com>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Sergi Jimenez <sjr at redhat dot com>

pkgname=virtctl-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${pkgver}/virtctl-v${pkgver}-linux-amd64")
sha512sums=('1f44e7d0ef0347210ae5ff0a683d6cd5c16d1c62532203c997356d17eb5d6a0a88ee16695a50f816526fba32f3c97231e3cb7accc1aede7dd27e0d2ea3816d26')

package() {
  install -Dm755 "${srcdir}/virtctl-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
