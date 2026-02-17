# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('bc6a74e00052bf54b78002a826a0d5f8ad796e3d1fba6d3f9e3d559147c31630')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
