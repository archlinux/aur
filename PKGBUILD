# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('835784ddbf8db36da932ff13c0b401a1267833eec4f64418655aeaab6b81b3af')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
