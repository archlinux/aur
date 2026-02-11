# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('b7761a8a0d6b0c191c09dc6ffad40fb69bb85c1385efdf4ac36d4e060dab11c6')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
