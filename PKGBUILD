# Maintainer: dcprevere
pkgname=org-cli-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='CLI for org-mode file manipulation and org-roam database management'
arch=('x86_64')
url='https://github.com/dcprevere/org-cli'
provides=('org-cli')
conflicts=('org-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/org-linux-x64.tar.gz")
sha256sums=('e79322360b13d54363dac9b5799ba532e2d72dcffb9cada90661fe730061b18a')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/org" "${pkgdir}/usr/bin/org"
}
