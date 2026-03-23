# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('392c2a0a65a6208635b3b354f67b5d785650eb604fe1b69800c52f03204c9267')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
