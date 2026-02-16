# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('8f25544afd35c763aab3766f1474f6905cead07d436dd381f75ac3b07189ae24')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
