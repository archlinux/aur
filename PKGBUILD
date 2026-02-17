# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('c1413b0a607282f600e1720b733b0748873c77840e439afb8392921b2aee45e5')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
