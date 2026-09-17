# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=2.0.0
pkgrel=2
pkgdesc='Standalone Org notes and task management for humans and agents'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('a5607ec46bf797c488e9832257f895cef5a6b4898e5250107c7614295ec7f50d')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
    install -Dm644 "${srcdir}/org-cli.service" "${pkgdir}/usr/lib/systemd/user/org-cli.service"
}
