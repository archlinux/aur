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
sha256sums=('17b7c77513f3028c37e96ad6241efb529090134faf33a337a6b4868192a662db')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
