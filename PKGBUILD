# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Standalone Org notes and task management for humans and agents'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('0c58ee661e4360c37fe0e369f7ff87521296fe3bc9d0f41759d01488c28928f1')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
