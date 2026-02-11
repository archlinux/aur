# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('cfa462cf8ef5a4b8f804461372238ed88912f2f8dcc389af878b4aecbd0a617e')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
