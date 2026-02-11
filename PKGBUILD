# Maintainer: dcprevere
pkgname=org-cli
pkgver=0.1.2
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('928a55ab9f732586cb21c3778e5b3cf6703c4fa7bed1ab896c77f114554e6938')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
