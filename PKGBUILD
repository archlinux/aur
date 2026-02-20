# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('f6219845c4cdc089b6e78472c96477eaa28a385a6149b89368b91b9fb2ac3576')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
