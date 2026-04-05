# Maintainer Lucas Nikola Pape <lpape at proton dot me>
# Contributor: Dessa Simpson <dxs at k7dxs dot net>
# Contributor: jbpratt <jbpratt78 at gmail dot com>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Sergi Jimenez <sjr at redhat dot com>

pkgname=virtctl-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Kubernetes Virtualization API and runtime in order to define and manage virtual machines (CLI)"
url="https://github.com/kubevirt/kubevirt"
license=('Apache')
arch=('x86_64')
provides=('virtctl')
conflicts=('virtctl')
source=("https://github.com/kubevirt/kubevirt/releases/download/v${pkgver}/virtctl-v${pkgver}-linux-amd64")
sha512sums=('d022d420e014c2c16805c7988dc98a1f5cf84d9a3acbf620c0cf8a1911f94a6222e56adf05ca59aeffb08ddbcc4b047d16e234ae16863b41c66136cc7ab60c9f')

package() {
  install -Dm755 "${srcdir}/virtctl-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/virtctl"
}
