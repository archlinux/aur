# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=2.0.0
pkgrel=3
pkgdesc='Standalone Org notes and task management for humans and agents'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('d5b00bbdb244f6e529928443cb5df252e3e74151b13ee38c3b023d092b96751c')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
    install -Dm644 "${srcdir}/org-cli.service" "${pkgdir}/usr/lib/systemd/user/org-cli.service"
}
