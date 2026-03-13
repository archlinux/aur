# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('cfb25514a2c3ab55f7d657d577b44730142384854af7edf36da12d7a94c32dc4')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
