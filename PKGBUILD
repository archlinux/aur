# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('98e80726b042b848d58cb56098c2a2ca6dd74c70cd0beead43aa259cc228edaf')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
