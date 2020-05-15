# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.1.5
pkgrel=2
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64')
url="https://developer.akamai.com/cli"
license=('Apache')
provides=('akamai' 'akamai-cli')
source=("${pkgname}-${pkgver}::https://github.com/akamai/cli/releases/download/${pkgver}/akamai-${pkgver}-linuxamd64")
sha256sums=('1aaf3248a610ffd8bdf1f9f96b5a91cf5bfc5bd788a7f6e01c3901b56b9c4d69')

package() {
  install -Dm755 "${srcdir}"/akamai* "${pkgdir}/usr/bin/akamai"
}
# vim:set ts=2 sw=2 et: